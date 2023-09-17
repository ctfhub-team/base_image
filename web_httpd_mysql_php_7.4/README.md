# web_httpd_mysql_php_7.4

## 环境版本

- Debian 9 (bullseye) amd64
- Apache/2.4.51
- PHP 7.4.27
- MariaDB 10.5.19-MariaDB-0+deb11u2

已安装扩展: `mysqli` `pdo_mysql`
默认软件源为 http://mirrors.tencent.com/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- php.ini: /usr/local/etc/php/php.ini

## 账号密码

|服务|账号|密码|主机|
|-|-|-|-|
|mysql|root|root|localhost|
|mysql|web|web|localhost|
|mysql|web|web|127.0.0.1|
|mysql|ping|ping|%|

## 示例

请查看`example`文件夹

