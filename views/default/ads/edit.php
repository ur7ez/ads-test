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

?>
<section class="col-lg-12">
    <h3 class="main-header">Edit Advertisement<?= $data['id'] ? ' (' . $data['id'] . ')' : '' ?></h3>

    <? if (($data['id'] && $session->get('id') === $data['user_id']) || !$data['id']): ?>
        <form action="<?= $router->buildUri('ads.edit', $data['id']) ?>" method="post"
              class="form-inline my-3 justify-content-center my-adv-form">
            <div class="form">
                <input type="hidden" name="id" class="form-control" value="<?= $data['id'] ?>">
                <div class="form-group row mb-2">
                    <label for="title" class="col-2">Adv title: </label>
                    <input type="text" id="title" name="title" class="form-control col-md-9" placeholder="adv title"
                           required
                           value="<?= $data['id'] ? $data['title'] : '' ?>">
                </div>
                <div class="form-group row mb-2">
                    <label for="description" class="col-2">Adv description: </label>
                    <textarea name="description" id="description" cols="70" rows="8" title="ads description here"
                              placeholder="ads description"
                              class="form-control col-md-9"><?= $data['id'] ? $data['description'] : '' ?></textarea>
                </div>
                <div class="form-group row mb-2">
                    <label for="published" class="col-2">Published? </label>
                    <input type="checkbox" id="published" name="published" class="form-control"
                           title="check to publish this ad (uncheck to hide)"
                           value="<?= ($data['published'] !== '') ? $data['published'] : '1' ?>"
                        <?= ($data['published'] || $data['published'] === '') ? ' checked' : '' ?>>
                </div>
                <div class="form-group row justify-content-end">
                    <button type="reset" class="btn btn-secondary mr-2">Reset</button>
                    <button type="submit" class="btn btn-success save-adv">Save</button>
                </div>
            </div>
        </form>
    <? else: ?>
        <div class="alert alert-danger py-1" role="alert">
            Unauthorized user access
        </div>
    <? endif; ?>
</section>
<script src="/js/ad_edit.js"></script>