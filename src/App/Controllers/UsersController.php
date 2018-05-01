<?php
/**
 * Created by PhpStorm.
 * User: Mike
 */

namespace App\Controllers;

use App\Core\App;
use App\Core\Config;
use App\Entity\User;

class UsersController extends Base
{
    /** @var User */
    private $usersModel;

    public function __construct($params = []) {
        parent::__construct($params);
        $this->usersModel = new User(App::getConnection());
    }

    public function registerAction() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST)) {
            $data = $_POST;
            if (!strlen($data['password']) || $data['password'] !== $data['password_cfm']) {
                App::getSession()->setFlash('Failed password integrity check');
            } else {
                if ($this->usersModel->register($data)) {
                    App::getSession()->setFlash('Thank you for registration!');
                    App::getRouter()->redirect('users.login');
                } else {
                    App::getSession()->setFlash(
                        'User with login \'' . $data['login'] . '\' already exists.
                     Choose another login or use <a href="' . App::getRouter()->buildUri('users.login') . '">Sign-in form</a>.');
                }
            }
        }
    }

    public function loginAction() {
//        $this->template = $this->getIndexTemplate();
        $ctrl = Config::get('defaultController');

        if ($_POST && isset($_POST['login']) && isset($_POST['password']) &&
            strlen($_POST['login']) && strlen($_POST['password'])) {
            $user = $this->usersModel->getByLogin($_POST['login']);
            $hash = md5(Config::get('sault') . $_POST['password']);
            if ($user) {
                if ($user['active']) {
                    if ($hash == $user['password']) {
                        App::getSession()->set('id', $user['id']);
                        App::getSession()->set('login', $user['login']);
                    } else {
                        App::getSession()->setFlash('Incorrect password for registered user. Try again or use another user name');
                    }
                } else {
                    App::getSession()->setFlash('user \'' . $user['login'] . '\' is deactivated by administrator');
                }
            } else {  // new user - register and proceed
                if ($this->usersModel->register($_POST)) {
                    $user = $this->usersModel->getByLogin($_POST['login']);
//                    App::getSession()->setFlash('Thank you for registration!');
                    App::getSession()->set('id', $user['id']);
                    App::getSession()->set('login', $user['login']);
                } else {
                    App::getSession()->setFlash('Registration error. Try again.');
                }
            }
        } else {
            App::getSession()->setFlash('Login / password can\'t be empty!');
        }

        App::getRouter()->redirect(($ctrl) ? "$ctrl.index" : ".");
    }

    public function logoutAction() {
        $curUser = App::getSession()->get('login');
        App::getSession()->destroy();
//        App::getSession()->setFlash('User \'' . $curUser . '\' logged out successfully.');
        App::getRouter()->redirect('.');
    }
}