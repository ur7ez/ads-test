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
$user_id = $session->get('id');
?>
<section class="col-lg-12">
    <h3 class="main-header">Advertisements</h3>
    <div class="row justify-content-center">
        <? foreach ($data['ads_all'] as $adv):
            $bg = $data['ads_styles'][rand(0, count($data['ads_styles']) - 1)];
            $text_color = ($bg == 'light') ? 'dark' : $bg;
            ?>
            <div class="card border-<?= $bg ?> mx-2 my-3 adv-card<?= ($user_id === $adv['user_id']) ? ' highlight-me'
                : '' ?>">
                <div class="card-header bg-transparent border-<?= $bg ?>">
                    Advertisement (ID <?= $adv['id'] ?>)
                </div>
                <div class="card-body text-<?= $bg ?>">
                    <h5 class="card-title">
                        <a href="<?= $router->buildUri('ads.view', $adv['id']) ?>"
                           class="card-link"><?= $adv['title'] ?></a>
                    </h5>
                    <h6 class="card-subtitle mb-2 text-muted">
                        Author: <i><?= $adv['login'] ?></i>
                    </h6>
                    <p class="card-text text-<?= $text_color ?>">
                        <?= $adv['description'] ?></p>

                    <? if ($session->get('id') === $adv['user_id']): ?>
                        <a href="<?= $router->buildUri('ads.edit', $adv['id']) ?>" class="card-link edit-adv">Edit</a>
                        <a href="<?= $router->buildUri('ads.delete', $adv['id']) ?>" class="card-link
                        delete-adv">Delete</a>
                    <? endif; ?>
                </div>
                <div class="card-footer text-muted">
                    Created at: <?= DateTime::createFromFormat(
                        'Y-m-d H:i:s',
                        $adv['created_at'])
                        ->format('Y-m-d') ?>
                </div>
            </div>
        <? endforeach; ?>
    </div>

    <!--        Pagination       -->
    <small class="d-block text-right mt-3">
        <nav aria-label="Page navigation" class="navbar-text">
            <ul class="pagination px-5">
                <?php $cnt = 0;
                foreach ($data['pagination']->buttons as $button) :
                    if ($cnt == 1) : ?>
                        <li class="page-item show-other-pages order-2"><span class="page-link"> ... </span></li>
                        <div class="card-deck btn-group-vertical paging mx-auto order-3">
                    <? endif;
                    if ($cnt == count($data['pagination']->buttons) - 1) : ?>
                        </div>
                    <? endif; ?>
                    <? if ($button->isActive) : ?>
                    <li class="page-item">
                        <a class="page-link clickable-pagelink"
                           href='<?= $router->buildUri('ads.index') . '?page=' . $button->page ?>'>
                            <?= $button->text ?></a>
                    </li>
                <?php else : ?>
                    <li class="page-item<?= ($button->isCurrent) ? ' active' : ' disabled' ?>">
                        <span class="page-link"><?= $button->text ?></span>
                    </li>
                <?php endif;
                    $cnt++;
                endforeach; ?>
            </ul>
        </nav>
    </small>

</section>