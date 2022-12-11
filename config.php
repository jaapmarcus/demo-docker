<?php 
return array (
  'debug' => false,
  'update_branch' => 'release',
  'log_stacktrace' => true,
  'stacktrace_length' => 25,
  'maintenance_mode' => 
  array (
    'enabled' => false,
    'allowed_urls' => 
    array (
    ),
    'allowed_ips' => 
    array (
    ),
  ),
  'salt' => 'c33d7ad7e4b7fe704a55ed242b81f971',
  'url' => 'https://demo.fossbilling.org/',
  'admin_area_prefix' => '/admin',
  'disable_auto_cron' => false,
  'sef_urls' => true,
  'timezone' => 'UTC',
  'locale' => 'en_US',
  'locale_date_format' => 'l, d F o',
  'locale_time_format' => ' G:i:s',
  'path_data' => '/var/www/html/data',
  'path_logs' => '/var/www/html/data/log/application.log',
  'log_to_db' => true,
  'db' => 
  array (
    'type' => 'mysql',
    'host' => 'mysql',
    'port' => '3306',
    'name' => 'exampledb',
    'user' => 'exampleuser',
    'password' => 'examplepass',
  ),
  'twig' => 
  array (
    'debug' => false,
    'auto_reload' => true,
    'cache' => '/var/www/html/data/cache',
  ),
  'api' => 
  array (
    'require_referrer_header' => false,
    'allowed_ips' => 
    array (
    ),
    'rate_span' => 3600,
    'rate_limit' => 1000,
    'throttle_delay' => 2,
    'rate_span_login' => 60,
    'rate_limit_login' => 20,
    'CSRFPrevention' => true,
  ),
  'guzzle' => 
  array (
    'user_agent' => 'Mozilla/5.0 (RedHatEnterpriseLinux; Linux x86_64; FOSSBilling; +http://fossbilling.org) Gecko/20100101 Firefox/93.0',
    'timeout' => 0,
    'upgrade_insecure_requests' => 0,
  ),
);