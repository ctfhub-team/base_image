# misc_python_3.11

## 环境版本

- Debian 12 (bookworm) amd64
- xinetd 1:2.3.15.3-1+b1
- Python 3.11.6

默认软件源为 http://mirrors.ustc.edu.cn/debian
默认pip源为 https://pypi.douban.com/simple

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- xientd: /etc/xientd.d/app

## 示例

请查看`example`文件夹

## 其他

本基础镜像仅用于需要cli方式使用(类似pwn)，对于Python Web请使用Web类Python镜像
默认入口为`/app/app.py`