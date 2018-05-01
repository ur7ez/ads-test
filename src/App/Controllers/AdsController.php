<?php
/**
 * Created by PhpStorm.
 * User: Mike Nykytenko
 */

namespace App\Controllers;

use App\Core\App;
use App\Core\Pagination;
use App\Entity\Ads;

class AdsController extends Base
{
    /** @var Ads */
    private $adsModel;

    public function __construct($params = []) {
        parent::__construct($params);

        $this->adsModel = new Ads(App::getConnection());
        $this->data['ads_styles'] = ['primary', 'secondary',
            'success', 'danger', 'warning', 'info', 'dark', 'light'];
    }

    public function indexAction() {
        $param = $this->params;
        $page = isset($param['query']['page']) ? (int)$param['query']['page'] : 1;
        $itemsCount = 0;

        if (empty($param[0])) {
            $this->data['ads_all'] = $this->adsModel->list(
                ['published' => 1],  // showing only published ads
                1,
                $this->itemsPerPage,
                $this->itemsPerPage * ($page - 1),
                [],
                $itemsCount
            );
        }

        $this->data['count_all'] = $itemsCount;
        $this->data['cur_number'] = $this->itemsPerPage * ($page - 1);
        $this->data['pagination'] = new Pagination([
            'itemsCount' => $itemsCount,
            'itemsPerPage' => $this->itemsPerPage,
            'currentPage' => $page,
        ]);
    }

    public function viewAction() {
        $id = isset($this->params[0]) ? $this->params[0] : null;

        $adv = $this->adsModel->list(
            ['id' => $id],
            1, 1
        );
        if (!empty($adv)) {
            $this->data['adv'] = $adv[0];
        } else {
            $this->page404();
        }
    }

    public function editAction() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $user_id = App::getSession()->get('id');
            $id = isset($this->params[0]) ? $this->params[0] : null;
            $id2 = isset($_POST['id']) ? $_POST['id'] : null;
            $adv = null;
            if ($id) {
                $adv = $this->adsModel->list(['id' => $id], 0, 1)[0];
            }
            if (!$user_id ||
                $adv && !($id && ($id === $id2) && $user_id && ($adv['user_id'] === $user_id))) {
                App::getSession()->setFlash('Unauthorized operation. Aborted.');
                return;
            }

            try {
                $this->data['adv'] = [
                    'user_id' => $user_id,
                    'title' => $_POST['title'],
                    'description' => $_POST['description'],
                    'published' => $_POST['published'],
                ];

                $this->adsModel->save($this->data['adv'], $id, 0);
                App::getSession()->setFlash('Advertisement data has been saved');
                if ($id) {
                    App::getRouter()->redirect('ads.view', $id);
                } else {
                    App::getRouter()->redirect('ads.index');
                    return;
                }

            } catch (\Exception $e) {
                App::getSession()->setFlash($e->getMessage());
            }
        }
        if (isset($this->params[0]) && $this->params[0] > 0) {
            $this->data = $this->adsModel->getById($this->params[0]);
        } else {
            $a = $this->adsModel->getFields(0);
            $this->data = array_combine($a, array_pad([], count($a), ''));
        }
    }

    public function deleteAction() {
        $id = isset($this->params[0]) ? $this->params[0] : null;
        if (!$id) {
            App::getSession()->setFlash('Missing Advertisement id');
        } elseif ($this->adsModel->delete($id)) {
            App::getSession()->setFlash('Advertisement has been successfully deleted');
            App::getRouter()->redirect('.');
        } else {
            App::getSession()->setFlash('Couldn\'t delete Advertisement');
        }
        App::getRouter()->redirect('index');
    }
}