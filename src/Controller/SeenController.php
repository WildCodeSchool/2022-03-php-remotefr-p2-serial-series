<?php

namespace App\Controller;

use App\Model\SeenManager;
class SeenController extends AbstractController
{
    public function update()
    {
        $seenManager = new SeenManager();
        if (!$this->user) {
            header('Location: /login');
            return null;
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $serieId = trim($_POST['serie_id']);
            $seen = $seenManager->selectSeenBySerieId(intval($serieId), $this->user['id']);

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
