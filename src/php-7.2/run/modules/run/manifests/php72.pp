class run::php72 {
  file { '/usr/local/src/phpfarm/inst/current/etc/php-fpm.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => "644"
  }

  include run::php72::ini::realpath_cache_size
  include run::php72::ini::realpath_cache_ttl
  include run::php72::ini::timezone
  include run::php72::ini::post_max_size
  include run::php72::ini::upload_max_filesize
  include run::php72::ini::short_open_tag
  include run::php72::ini::max_execution_time
  include run::php72::ini::max_input_vars
  include run::php72::ini::memory_limit
  include run::php72::ini::display_errors
  include run::php72::ini::display_startup_errors
  include run::php72::ini::error_reporting
  include run::php72::ini::expose_php
  include run::php72::ini::allow_url_fopen
  include run::php72::ini::sys_temp_dir

  if $php_ini_opcache == "On" {
    include run::php72::ini::opcache
  }

  if $php_ini_xdebug == "On" {
    include run::php72::ini::xdebug
  }

  if $php_ini_redis == "On" {
    include run::php72::ini::redis
  }
}
