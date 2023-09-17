# pwn_xinetd

## 环境版本

- Debian 12 (bookworm) amd64
- xinetd 1:2.3.15.3-1+b1

默认软件源为 http://mirrors.ustc.edu.cn/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- xientd: /etc/xientd.d/pwn

## 示例

请查看`example`文件夹

## 其他

未使用chroot方式启动
