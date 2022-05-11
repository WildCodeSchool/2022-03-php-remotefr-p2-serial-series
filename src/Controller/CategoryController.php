<?php

namespace App\Controller;

use App\Model\SerieManager;
use App\Model\CategoryManager;

class CategoryController extends AbstractController
{
    public function index(): string
    {

        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectAll();
        $serieManager = new SerieManager();
        $series = $serieManager->selectAll();
        return $this->twig->render('category/category.html.twig', [
            'categories' => $categories,
            'series' => $series
        ]);
    }
}
