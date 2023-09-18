# pwn_socat

## 环境版本

- Debian 12 (bookworm) amd64
- socat 1.7.4.4

默认软件源为 http://mirrors.ustc.edu.cn/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- xientd: /etc/xientd.d/pwn

## 示例

请查看`example`文件夹

## 其他

默认使用新建的pwn用户启动，具体启动命令如下

```bash
socat tcp-listen:10000,reuseaddr,fork,su=pwn exec:/pwn
```
