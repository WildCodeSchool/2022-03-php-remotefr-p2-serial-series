<?php

namespace App\Model;

class UserManager extends AbstractManager
{
    public const TABLE = 'user';

    /**
     * Get one row from database by email.
     *
     */
    public function selectOneByEmail(string $email): array|false
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . static::TABLE . " WHERE email=:email");
        $statement->bindValue('email', $email, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function insert(array $form): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . static::TABLE .
            " (`email`, `password`, `pseudo`, `firstname`, `lastname`)
        VALUES (:email, :password, :pseudo, :firstname, :lastname)");
        $statement->bindValue(':email', $form['email']);
        $statement->bindValue(':password', password_hash($form['password'], PASSWORD_DEFAULT));
        $statement->bindValue(':pseudo', $form['pseudo']);
        $statement->bindValue(':firstname', $form['firstname']);
        $statement->bindValue(':lastname', $form['lastname']);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
