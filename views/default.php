<?php
/**
 * Created by PhpStorm.
 * User: Mike Nykytenko
 */

/**
 * @var array $data from \App\Views\Base::render()
 * @var \App\Core\Router $router from \App\Core\App::getRouter()
 * @var \App\Core\Session $session from \App\Core\App::getSession()
 */

$action = strtolower($router->getAction(true));
$ctrlr = strtolower($router->getController(true));
$xhr = isset($_GET['transport']) && $_GET['transport'] === 'xhr';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= \App\Core\Config::get('siteName') ?></title>
    <link rel="icon" href="/favicon.png" type="image/png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="<?= (App\Core\Config::get('debug')) ? '/css/bootstrap.min.css' : 'https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css' ?>">
    <link rel="stylesheet" href="/css/default.css">
</head>
<body class="bg-light">
<h1 class="main-header"><?= \App\Core\Config::get('siteName') ?></h1>
<nav class="nav justify-content-md-between">
    <div class="nav">
        <a class="btn btn-primary mr-2" id="nav-home"
           href="<?= $router->buildUri('.') ?>">Home</a>

        <? if ($session->get('login')): ?>
        <a class="btn btn-primary mr-2" id="create-ad"
           href="<?= $router->buildUri('ads.edit') ?>">Create Ad</a>
    </div>
    <div class="nav">
        <div class="welcome-msg mr-3 align-self-center">
            Wellcome, <i><?= $session->get('login') ?></i>
        </div>
        <a class="btn btn-outline-primary"
           id="user-logout" href="<?= $router->buildUri('users.logout') ?>">Logout</a>
    </div>
    <? else: ?>
        </div>
        <form action="<?= $router->buildUri('users.login') ?>" method="post" class="form-inline my-2 my-lg-0">
            <div class="form-row">
                <div class="col-sm">
                    <input type="text" id="login" name="login" class="form-control" placeholder="username"
                           required>
                </div>
                <div class="col-sm">
                    <input type="password" id="password" name="password" class="form-control"
                           placeholder="password" required>
                </div>
                <button type="submit" class="btn btn-success">Login</button>
            </div>
        </form>
    <? endif; ?>

</nav>

<main class="container-flex pt-3 px-3 pb-1" role="main">
    <? if ($session->hasFlash()):
        foreach ($session->flash() as $msg): ?>
            <div class="alert alert-info py-1" role="alert">
                <?= $msg ?>
            </div>
        <? endforeach;
    endif; ?>

    <div class="content">
        <?= $data['content'] ?>
    </div>
</main>

<footer class="footer">
    <div class="container">
        <span class="text-muted">(c) Mike Nykytenko. April, 2018</span>
    </div>
</footer>
<script src="/js/default.js"></script>
</body>
</html>