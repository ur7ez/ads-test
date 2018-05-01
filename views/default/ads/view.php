<?php
/**
 * Created by PhpStorm.
 * User: Mike
 */

/**
 * @var array $data from \App\Views\Base::render()
 * @var \App\Core\Router $router from \App\Core\App::getRouter()
 * @var \App\Core\Session $session from \App\Core\App::getSession()
 */

$adv = $data['adv'];
$bg = $data['ads_styles'][rand(0, count($data['ads_styles']) - 1)];
?>
<section class="col-lg-12">
    <h3 class="main-header">Advertisement (<?= $adv['id'] ?>)</h3>

    <div class="view-adv card text-<?= ($bg == 'white' || $bg == 'light') ? 'dark' : 'white' ?> bg-<?= $bg ?> mb-3
    box-shadow">
        <div class="card-header bg-info">
            <h4 class="my-0 font-weight-normal text-center"><?= $adv['title'] ?></h4>
        </div>
        <div class="card-body p-2">
            <span><?= $adv['description'] ?></span>
        </div>
        <div class="card-footer bg-transparent">
            Author: <i><?= $adv['login'] ?></i>
            <span class="cr-date">Creation date: <b><?= DateTime::createFromFormat(
                    'Y-m-d H:i:s',
                    $adv['created_at'])
                    ->format('Y-m-d') ?></b></span>
        </div>
    </div>

    <? if ($session->get('id') === $adv['user_id']): ?>
    <div class="row justify-content-center">
        <button type="button" class="btn btn-outline-danger mr-2">
            <a href="<?= $router->buildUri('ads.delete', $adv['id']) ?>" class="delete-adv">Delete</a>
        </button>
        <button type="button" class="btn btn-outline-success">
            <a href="<?= $router->buildUri('ads.edit', $adv['id']) ?>" class="edit-adv">Edit</a>
        </button>
    </div>
    <? endif; ?>
</section>