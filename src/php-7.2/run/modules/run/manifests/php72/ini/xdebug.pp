class run::php72::ini::xdebug {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/xdebug.ini':
    ensure => present,
    content => template('run/php72/ini/xdebug.ini.erb'),
    mode => 644
  }
}
