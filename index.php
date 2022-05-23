<?php
require_once('functions.php');
require_once('data.php');

$link = mysqli_connect('localhost', 'root', '','yeticavemuhov');
mysqli_set_charset($link, utf8);

if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
}
else {
    $sql = 'SELECT * FROM category';
    $result = mysqli_query($link, $sql);

    if ($result) {
        $arrayCategories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }

    $sql = 'SELECT * FROM lots left join category on lots.id_category=category.id_category';
    $result = mysqli_query($link, $sql);

    if ($result) {
        $arrayLots = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }
}

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

?>

