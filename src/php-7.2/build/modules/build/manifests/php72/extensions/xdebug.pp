class build::php72::extensions::xdebug {
  require build::php72

  file { '/tmp/xdebug-2.6.1.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.6.1.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.6.1.tgz':
    require => File['/tmp/xdebug-2.6.1.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.6.1 && phpize-7.2.15':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.6.1.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.6.1 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.2.15':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.6.1 && phpize-7.2.15']
  }

  bash_exec { 'cd /tmp/xdebug-2.6.1 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.6.1 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.2.15']
  }

  bash_exec { 'cd /tmp/xdebug-2.6.1 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.6.1 && make']
  }
}
