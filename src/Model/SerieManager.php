<?php

namespace App\Model;

class SerieManager extends AbstractManager
{
    public const TABLE = 'serie';

    public function selectAll(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT *, s.id, s.title AS serieTitle FROM ' . static::TABLE
        . ' AS s JOIN ' . CategoryManager::TABLE . ' AS c ON s.category_id=c.id ';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }

        return $this->pdo->query($query)->fetchAll();
    }

    /**
     * Insert new item in database
     */
    public function insert(array $serie): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE .
        " (`title`, `description`, `image`, `category_id`) 
        VALUES (:title, :description, :image, :category_id)");
        //$statement->bindValue('category', $serie['category'], \PDO::PARAM_INT);
        $statement->bindValue('title', $serie['title'], \PDO::PARAM_STR);
        $statement->bindValue('description', $serie['description'], \PDO::PARAM_STR);
        $statement->bindValue('image', $serie['image'], \PDO::PARAM_STR);
        $statement->bindValue('category_id', $serie['category'], \PDO::PARAM_INT);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update serie in database
     */
     public function update(array $serie): bool
         {
            $query = "UPDATE" . self::TABLE .
            " SET `title`=:title,
            `description`=:description, `category_id`=:category_id";

            if (isset($serie['image'])) {
                $query .= ", `image`=:image";
            }
            $query .= "WHERE `ìd`=:id";
            $statement = $this->pdo->prepare($query);
            $statement->bindValue('id', $serie['id'], \PDO::PARAM_INT);
            $statement->bindValue('title', $serie['title'], \PDO::PARAM_STR);
            $statement->bindValue('description', $serie['serie'], \PDO::PARAM_STR);
            if (isset($serie['image'])) {
                $statement->bindValue('image', $serie['image'], \PDO::PARAM_STR);
            }
            $statement->bindValue('category_id', $serie['category'], \PDO::PARAM_INT);

            return $statement->execute();
    }
}
