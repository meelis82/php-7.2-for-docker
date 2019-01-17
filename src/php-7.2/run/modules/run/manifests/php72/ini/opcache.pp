class run::php72::ini::opcache {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/opcache.ini':
    ensure => present,
    content => template('run/php72/ini/opcache.ini.erb'),
    mode => "644"
  }
}
