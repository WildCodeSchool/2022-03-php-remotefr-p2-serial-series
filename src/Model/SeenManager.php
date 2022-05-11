<?php

namespace App\Model;

class SeenManager extends AbstractManager
{
    public const TABLE = 'seen';

    /**
     * Insert new item in database
     */
    public function insert(array $seen): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`status`, `serie_id`, `user_id`) VALUES (:status, :serie_id, :user_id)");
        $statement->bindValue('status', $seen['status'], \PDO::PARAM_STR);
        $statement->bindValue('serie_id', $seen['serie_id'], \PDO::PARAM_INT);
        $statement->bindValue('user_id', $_SESSION['user_id'], \PDO::PARAM_INT);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update item in database
     */
    public function update(array $seen): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `status` = :status WHERE id=:id");
        $statement->bindValue('status', $seen['status'], \PDO::PARAM_STR);
        $statement->bindValue('id', $seen['id'], \PDO::PARAM_INT);

        return $statement->execute();
    }

    /**
     * Get one row from database by ID.
     */
    public function selectSeenBySerieId(int $serieId): array|false
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . self::TABLE . " WHERE serie_id=:serie_id AND user_id=:user_id");
        $statement->bindValue('serie_id', $serieId, \PDO::PARAM_INT);
        $statement->bindValue('user_id', $_SESSION['user_id'], \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }
}

// // public function selectDistinctAll(string $orderBy = '', string $direction = 'ASC'): array
    // // {
    // //     $query = 'SELECT DISTINCT s.id, s.is_completed FROM ' . static::TABLE
    // //     . ' AS s JOIN ' . SerieManager::TABLE . ' AS s ON s.seen_id=s.id ';
    // //     if ($orderBy) {
    // //         $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
    // //     }

    // //     return $this->pdo->query($query)->fetchAll();
    // // }