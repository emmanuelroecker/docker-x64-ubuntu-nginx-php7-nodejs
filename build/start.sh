#!/bin/sh

touch /var/log/cron.log
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

