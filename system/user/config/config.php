<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['index_page'] = 'index.php';
// ExpressionEngine Config Items
// Find more configs and overrides at
// https://docs.expressionengine.com/latest/general/system_configuration_overrides.html

$config['app_version'] = '6.0.0-b.3';
$config['encryption_key'] = '7454e2a0984c5f73cb2ae0c9c34ad13f1c24ab4c';
$config['session_crypt_key'] = '1c38c71f77029bcb41d83d2a0747bda9d377f6cd';
$config['database'] = array(
	'expressionengine' => array(
		'hostname' => 'localhost',
		'database' => 'learn_ee',
		'username' => 'root',
		'password' => '',
		'dbprefix' => 'exp_',
		'char_set' => 'utf8mb4',
		'dbcollat' => 'utf8mb4_unicode_ci',
		'port'     => ''
	),
);
$config['show_ee_news'] = 'y';
$config['share_analytics'] = 'y';

$config['allow_dictionary_pw'] = 'n';

// EOF