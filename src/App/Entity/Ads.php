<?php
/**
 * Created by PhpStorm.
 * User: Mike Nykytenko
 */

namespace App\Entity;

class Ads extends Base
{
    /**
     * @param int $choose
     * @return string
     */
    public function getTableName($choose = 0) {
        $newsTables = [
            'site_ads',     // use 'published' field to filter only visible ads
            'ads_all',     // use 'published' field to filter only visible ads
        ];
        return $newsTables[$choose];
    }

    /**
     * @param int $choose
     * @return mixed
     */
    public function getFields($choose = 0) {
        $phonebookFields = [
            'site_ads' => [
                'id',
                'user_id',      // id from `users` table
                'title',
                'description',
                'created_at',
                'published',    // use this field to filter only visible ads
            ],
            'ads_all' => [
                'id',
                'user_id',      // id from `users` table
                'title',
                'description',
                'created_at',
                'published',    // use this field to filter only visible ads
                'login',
                'user_name',
                'user_active',  // `1` if a user is an active user
            ],
        ];
        return array_values($phonebookFields)[$choose];
    }

    /**
     * Проверяет поля таблицы, в которую будем
     * вносить изменения в методе parent::save()
     * @param $data
     * @throws \Exception
     */
    public function checkFields($data) {
        $msg = [];
        foreach ($data as $key => $val) {
            switch ($key) {
                case 'title':
                case 'description':
                    if (!is_string($val) || !strlen($val)) {
                        $msg[] = "Ad's $key can\'t be empty";
                    }
                    break;
                default:
            }
        }
        if ($msg) {
            throw new \Exception(implode('; ', $msg));
        }
    }
}