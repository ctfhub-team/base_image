#!/bin/bash
mysql_ready() {
    mysqladmin ping -h 127.0.0.1 -uping -pping > /dev/null 2>&1
}

mysql_run() {
    /usr/bin/mysqld_safe --user=root --skip-name-resolve --skip-networking=0 &
}
# Run MySQL before `source /flag.sh`
echo "[+] Init MySQL"
while !(mysql_ready)
do
    mysql_run
    sleep 3s
done

ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock

echo "[+] Import DB"
if [[ -f /var/www/html/db.sql ]]; then
    sed -i "s#FLAG#$FLAG#" /var/www/html/db.sql
    mysql -uroot -proot -e "source /var/www/html/db.sql;"
    rm -rf /var/www/html/db.sql
fi

if [[ -e /flag.sh ]]; then
	echo "[+] Init flag.sh"
	source /flag.sh
	rm /flag.sh && unset FLAG
fi

if [[ -e /start.sh ]]; then
	echo "[+] Init start.sh"
	source /start.sh
	rm /start.sh
fi

php-fpm &
nginx &

echo "Running..."
tail -F /var/log/nginx/*.log