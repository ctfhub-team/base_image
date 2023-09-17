FROM ctfhub_base/web_httpd_mysql_php_7.4

COPY files/flag.sh /flag.sh
COPY src /var/www/html/

RUN chown www-data:www-data /var/www/html -R