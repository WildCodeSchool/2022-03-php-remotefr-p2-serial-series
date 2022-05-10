<?php

namespace App\Controller;

use App\Model\SerieManager;
use App\Model\CategoryManager;

class SerieController extends AbstractController
{
    public function index(): string
    {
        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectDistinctAll();
        $serieManager = new SerieManager();
        $series = $serieManager->selectAll();
        return $this->twig->render('Serie/index.html.twig', [
            'categories' => $categories,
            'series' => $series
        ]);
    }

    /**
     * Show informations for a specific item
     */
    // public function show(int $id): string
    // {
    //     $serieManager = new SerieManager();
    //     $serie = $serieManager->selectOneById($id);

    //     return $this->twig->render('Serie/index.html.twig', ['serie' => $serie]);
    // }


    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $serie = array_map('trim', $_POST);

            $fileName = $_FILES['image']['name'];
            $uploadFile = __DIR__ . '/../../public/uploads/' . $fileName;
            if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile)) {
                $serieManager = new SerieManager();
                $serie['image'] = $fileName;
                $serieManager->insert($serie);
                header('Location:/category');
                return null;
            }
        }
        $categoryManager = new CategoryManager();
        return $this->twig->render('Serie/add.html.twig', [
            'categories' => $categoryManager->selectAll()
        ]);
    }
    /**
     * Show informations for a specific item
     */
    public function show(int $id): string
    {
        $serieManager = new SerieManager();
        $serie = $serieManager->selectOneById($id);
        $suggestedSeries = $serieManager->selectSuggestedSeries();
        return $this->twig->render('Serie/index.html.twig', [
            'serie' => $serie,
            'suggestedSeries' => $suggestedSeries
        ]);
    }

    /**
     * Edit a specific item
     */
    public function edit(int $id): ?string
    {
        $serieManager = new serieManager();
        $serie = $serieManager->selectOneById($id);
        
       

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $serie = array_map('trim', $_POST);

            if (!empty($_FILES['image']['name'])) {
                $fileName = $_FILES['image']['name'];
                $uploadFile = __DIR__ . '/../../public/uploads/' . $fileName;
                move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile);
                $serie['image'] = $fileName;
            }
            $serieManager->update($serie); // if validation is ok, update and redirection
            header('Location:/serie/edit?id=' . $id); // we are redirecting so we don't want any content rendered
            return null;
        }
        $serie = $serieManager->selectOneById($id);
        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectAll();
        return $this->twig->render('Serie/edit.html.twig', [
            'serie' => $serie,
            'categories' => $categories
        ]);
    }
}
