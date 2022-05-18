<?php
require_once('functions.php');
require_once('data.php');

$page_content = include_template('index.php', [
    'arrayCategories'=>$arrayCategories,
    'arrayLots'=>$arrayLots]);
$layout_content = include_template('layout.php', [
    'arrayCategories'=>$arrayCategories,
    'mainContent' => $page_content,
    'pageTitle' => 'Главная страница',
    'is_auth'=>$is_auth,
    'user_name' => $user_name,
    'arrayLots'=>$arrayLots
]);
print($layout_content);


