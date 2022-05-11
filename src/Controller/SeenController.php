<?php

namespace App\Controller;

use App\Model\SeenManager;

/**
         * 
         * Etape 1 - verifier soumission en Post
         * Etape 2 - récupérer id de la série
         * Etape 3 - vérifier s'il existe un enregistrement pour cet id (serie_id) et pour l'utilisateur connecté dans la table seen
         * Etape 4 - si oui, maj le nouveau statut 
         * Etape 5 - si non, insérer un nouvel enregitrement de la serie et id user
         * Etape 6 - rediriger user avec header location serie/show?id=serie_id
         */

class SeenController extends AbstractController
{

    public function update()
    {
        $seenManager = new SeenManager();
        //$seen = $seenManager->insert();

        if(!$this->user) {
            header('Location: /login');
            return null;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $serieId = trim($_POST['serie_id']);
            $seen = $seenManager->selectSeenBySerieId($serieId);
            if ($seen) {
                //si un enregistrement a été trouvé en BDD
                $seen['status'] = $_POST['status'];
                $seenManager->update($seen);
            } else {
                //sinon on insert un nouvel enregistrement
                $seen = $_POST;
                $seenManager->insert($seen);
            }

             // if validation is ok, update and redirection
            header('Location:/serie/show?id=' . $serieId); // we are redirecting so we don't want any content rendered
            return null;
        }
    }
}