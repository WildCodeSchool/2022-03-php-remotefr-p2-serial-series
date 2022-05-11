<?php

namespace App\Model;

class CategoryManager extends AbstractManager
{
    public const TABLE = 'category';

    public function selectDistinctAll(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT DISTINCT c.id, c.title FROM ' . static::TABLE
        . ' AS c JOIN ' . SerieManager::TABLE . ' AS s ON s.category_id=c.id ';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }

        return $this->pdo->query($query)->fetchAll();
    }
}
