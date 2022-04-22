<?php

namespace App\Controller;

use App\Model\CategoryManager;

class CategoryController extends AbstractController
{
    public function index(): string
    {
        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectAll();
        //$serieManager = new SerieManager();
        //$series = $serieManager->selectAll();
        return $this->twig->render('Category/index.html.twig', [
            'categories' => $categories,
            //'series' => $series
        ]);
    }
}
