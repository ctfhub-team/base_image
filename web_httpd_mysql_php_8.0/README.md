# web_httpd_mysql_php_8.0

## 环境版本

- Debian 11 (bullseye) amd64
- Apache/2.4.56
- PHP 8.0.30
- MariaDB 10.5.19-MariaDB-0+deb11u2

已安装扩展: `mysqli` `pdo_mysql`
默认软件源为 http://mirrors.tencent.com/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- php.ini: /usr/local/etc/php/php.ini
- 000-default.conf: /etc/apache2/sites-available/000-default.conf

## 账号密码

|服务|账号|密码|主机|
|-|-|-|-|
|mysql|root|root|localhost|
|mysql|web|web|localhost|
|mysql|web|web|127.0.0.1|
|mysql|ping|ping|%|

## 示例

请查看`example`文件夹

## 其他

位于`src/db.sql`的数据库文件将在启动时自动导入