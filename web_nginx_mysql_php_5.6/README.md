# web_nginx_mysql_php_5.6

## 环境版本

- Debian 9 (stretch) amd64
- nginx/1.10.3
- PHP 5.6.40

已安装扩展: `mysql` `mysqli` `pdo_mysql`
默认软件源为 http://mirrors.tencent.com/debian-archive/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`

## 配置文件

- php.ini: /usr/local/etc/php/php.ini
- nginx.conf: /etc/nginx/nginx.conf

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