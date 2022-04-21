<?php

namespace App\Controller;

class EditorController extends AbstractController
{
    public function index(): string
    {
        return $this->twig->render('Editor/index.html.twig');
    }
}
