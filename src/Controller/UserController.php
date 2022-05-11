<?php

namespace App\Controller;

use App\Model\UserManager;

class UserController extends AbstractController
{
    public function login()
    {
        $errors = [];
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            $form = array_map('trim', $_POST);
            
            if (empty($form['email'])) {
                $errors[] = "Email is required";
            }

            if (empty($form['password'])) {
                $errors[] =  "Password is required";
            }

            if(empty($errors)) {
                $userManager = new UserManager();
                $user = $userManager->selectOneByEmail($form['email']);

                if ($user && password_verify($form['password'], $user['password'])) {
                    $_SESSION['user_id'] = $user['id'];
                    header('Location: /');
                    exit();
                }
            }
        }
        return $this->twig->render('user/login.html.twig',
        [
            'errors' => $errors
        ]);
    }

    public function logout()
    {
        unset($_SESSION['user_id']);
        header('Location: /');
        exit();
    }

    public function register()
    {
        $errors = [];
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $form = $_POST;
            if (empty($form['pseudo'])) {
                $errors[] = "Pseudo is required :p";
            }
            
            if (empty($form['firstname'])) {
                $errors[] = "Firstname is required :p";
            }
           
            if (empty($form['lastname'])) {
                $errors[] =  "Lastname is required :p";
            }

            if (empty($form['email'])) {
                $errors[] = "Email required :p";
            }

            if (empty($form['password'])) {
                $errors[] =  "Password is required :p";
            }

            if(empty($errors)) {
                $userManager = new UserManager();
                if ($userManager->insert($form)) {
                    return $this->login();
                }
            }
        }
        return $this->twig->render('user/register.html.twig', [
            'errors' => $errors
        ]);
    }
}
