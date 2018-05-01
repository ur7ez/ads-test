<?php
/**
 * Created by PhpStorm.
 * User: Mike
 */

use App\Core\Config;

/**
 * Routing
 */
Config::set('routes', ['default']);
Config::set('defaultRoute', 'default');
Config::set('defaultController', 'ads');
Config::set('defaultAction', 'index');

/**
 * Pagination
 */
Config::set('itemsPerPage', 5);

/**
 * Debug
 */
Config::set('debug', true);


/**
 * Meta
 */
Config::set('siteName', 'Giraffe Software Ads');


/**
 * Database
 */
Config::set('db.host', 'localhost:3306');
Config::set('db.user', 'root');
Config::set('db.password', '');
Config::set('db.name', 'ads');

/**
 * User
 */
Config::set('sault', 'sdf703dfg884$hsd7dfdf4');