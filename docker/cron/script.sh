#echo "$(date): executed script" >> /var/log/cron.log 2>&1
#/usr/bin/php /var/www/html/artisan schedule:run >> /var/log/cron.log 2>&1
/usr/bin/php /var/www/html/artisan schedule:run
