#!/usr/bin/env bash

puppet apply --modulepath=/src/php-7.2/run/modules /src/php-7.2/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
