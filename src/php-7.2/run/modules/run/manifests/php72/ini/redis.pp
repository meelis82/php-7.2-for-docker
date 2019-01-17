class run::php72::ini::redis {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/redis.ini':
    ensure => present,
    content => template('run/php72/ini/redis.ini.erb'),
    mode => "644"
  }
}
