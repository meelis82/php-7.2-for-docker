class run {
  require run::user

  include run::php70
  include run::smtp
  include run::drush
  include run::timezone

  if $crontab_1_expression and $crontab_1_command {
    include run::cron
  }

  if $php_ini_blackfire == "On" and $php_ini_blackfire_server_id and $php_ini_blackfire_server_token {
    include run::blackfire
  }

  if $mysql_host {
    include run::mysql
  }

  if $memcached_host {
    include run::memcached
  }

  if $freetds_1_server_name {
    include run::freetds
  }
}
