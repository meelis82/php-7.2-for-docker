class build::php72::extensions::igbinary {
  require build::php72

  file { '/tmp/igbinary7-master.zip':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php72/extensions/igbinary/igbinary7-master.zip'
  }

  bash_exec { 'cd /tmp && unzip igbinary7-master.zip':
    require => File['/tmp/igbinary7-master.zip']
  }

  bash_exec { 'cd /tmp/igbinary7-master && phpize-7.2.15':
    require => Bash_exec['cd /tmp && unzip igbinary7-master.zip']
  }

  bash_exec { 'cd /tmp/igbinary7-master && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.2.15 --enable-igbinary':
    timeout => 0,
    require => Bash_exec['cd /tmp/igbinary7-master && phpize-7.2.15']
  }

  bash_exec { 'cd /tmp/igbinary7-master && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/igbinary7-master && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.2.15 --enable-igbinary']
  }

  bash_exec { 'cd /tmp/igbinary7-master && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/igbinary7-master && make']
  }

  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/igbinary.ini':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/current/etc/conf.d/igbinary.ini',
    mode => "644",
    require => Bash_exec['cd /tmp/igbinary7-master && make install']
  }
}
