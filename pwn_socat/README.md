# pwn_socat

## 环境版本

- Debian 12 (bookworm) amd64
- socat 1.7.4.4
- libc 2.36
- patchelf 0.14.3

默认软件源为 http://mirrors.ustc.edu.cn/debian

## 环境变量

- FLAG: 设置flag，如不覆盖flag.sh则默认写入到`/flag`，如需要单独设置flag存储到数据，请查看示例

## 配置文件

- xientd: /etc/xientd.d/pwn
- pwn: /app/pwn
- libc.so: /app/libc.so
- ld.so: /app/ld.so

## 示例

请查看`example`及`example_libc`文件夹

## 其他

- 环境内置libc二进制请查看本目录下`libc-2.36_x64.so`及`libc-2.36_x86.so`
- `/app/run.sh`可被覆盖，将在每次连接时调用
- pwn二进制默认以`pwn`用户身份启动，具体启动命令如下

```bash
socat tcp-listen:10000,reuseaddr,fork,su=pwn exec:/pwn
```

## libc 修改

可参考`example_libc`目录中的示例

新增如下文件，环境启动时会自动调用patchelf更换ld.so及lib.so的路径

```bash
./files/start.sh  启动脚本，将在环境初始化完成后运行
./src/ld.so       对应libc版本的动态连接器
./src/libc.so     对应版本的libc
./src/pwn         pwn二进制
```

最终修改完成后的elf ldd如下
```bash
root@1ad5afdc7626:/app# ldd pwn
    linux-vdso.so.1 (0x00007ffe0a73e000)
    /app/libc.so (0x00007f2588e64000)
    /app/ld.so => /lib64/ld-linux-x86-64.so.2 (0x00007f258903a000)
```
