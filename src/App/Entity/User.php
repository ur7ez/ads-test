<?php
/**
 * Created by PhpStorm.
 * User: Mike Nykytenko
 */

namespace App\Entity;

use App\Core\Config;

class User extends Base
{
    /**
     * @param int $choose
     * @return string
     */
    public function getTableName($choose = 0)
    {
        return 'users';
    }

    /**
     * @param array $data
     * @return bool|void
     * @throws \Exception
     */
    public function checkFields($data)
    {
        if (!isset($data['login']) || !isset($data['password'])
            || !strlen($data['login']) || !strlen($data['password'])) {
            throw new \Exception('Registration data fields can\'t be empty');
        }
    }

    /**
     * @param int $choose
     * @return array
     */
    public function getFields($choose = 0)
    {
        $usersFields = [
            'users' => [
                'id',
                'login',    // unique required
                'password', // required
                'name',
                'email',
                'active',
            ]
        ];
        return array_values($usersFields)[$choose];
    }

    /**
     * @param array $data
     * @return bool|mixed
     */
    public function register($data)
    {
        if ($this->getByLogin($data['login'])) {
            return false;
        } else {
            $data['password'] = md5(Config::get('sault') . $data['password']);
            return $this->save($data);
        }
    }

    /**
     * @param $login
     * @return mixed|null
     */
    public function getByLogin($login)
    {
        $result = [];
        if (isset($login) && $login !== '') {
            $sql = 'SELECT * FROM ' . $this->getTableName()
                . ' WHERE login = ' . $this->conn->escape($login) . ' LIMIT 1';
            $result = $this->conn->query($sql);
        }
        return isset($result[0]) ? $result[0] : null;
    }
}