#!/bin/bash
set -e

mysql_ready() {
    echo "[+] mysql_ready"
    mysqladmin ping -h 127.0.0.1 -uping -pping > /dev/null 2>&1
}

run_mysql() {
    echo "[+] run_mysql"
    /usr/bin/mysqld_safe --user=root --skip-name-resolve --skip-networking=0 &
}

keep_alive(){
    while true
    do
        mysql_ready
        run_mysql
        sleep 5s
    done
}

# Run MySQL before `source /flag.sh`
echo "[+] Init MySQL"
while !(mysql_ready)
do
    run_mysql
    sleep 3s
done

ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock

echo "[+] Import DB"
if [[ -f /var/www/html/db.sql ]]; then
    sed -i "s#FLAG#$FLAG#" /var/www/html/db.sql
    mysql -uroot -proot -e "source /var/www/html/db.sql;"
    rm -rf /var/www/html/db.sql
fi

echo "[+] Init flag.sh"
if [ -e /flag.sh ]; then
    source /flag.sh
fi

keep_alive &

php-fpm &
nginx &

echo "Running..."
tail -F /var/log/nginx/*.log