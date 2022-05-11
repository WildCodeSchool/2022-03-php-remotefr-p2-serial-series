<?php

// list of accessible routes of your application, add every new route here
// key : route to match
// values : 1. controller name
//          2. method name
//          3. (optional) array of query string keys to send as parameter to the method
// e.g route '/item/edit?id=1' will execute $itemController->edit(1)
return [
    '' => ['HomeController', 'index',],
    'seen/update' => ['SeenController', 'update'],
    'category' => ['CategoryController', 'index',],
    'serie' => ['SerieController', 'index',],
    'serie/show' => ['SerieController', 'show', ['id']],
    'serie/edit' => ['SerieController', 'edit', ['id']],
    'serie/delete' => ['SerieController', 'delete', ['id']],
    'login' => ['UserController', 'login',],
    'logout' => ['UserController', 'logout',],
    'register' => ['UserController', 'register',],
    'serie/add' => ['SerieController', 'add',],
    'items' => ['ItemController', 'index',],
    'items/edit' => ['ItemController', 'edit', ['id']],
    'items/show' => ['ItemController', 'show', ['id']],
    'items/add' => ['ItemController', 'add',],
    'items/delete' => ['ItemController', 'delete',],
];
