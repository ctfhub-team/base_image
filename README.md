# CTFHub 基础环境仓库

各个环境说明请进入对应目录查看

## 镜像拉取

镜像存放地址:
1. `registry.cn-hangzhou.aliyuncs.com`
2. `dockerhub`

镜像命名空间: 阿里云:`ctfhub_base`, dockerhub:`ctfhub`

例如，要拉取web_httpd_php_5.6，则完整的pull命令如下

```bash
# 从dockerhub拉取
docker pull ctfhub/web_httpd_php_5.6

# 从阿里云拉取
docker pull registry.cn-hangzhou.aliyuncs.com/ctfhub_base/web_httpd_php_5.6
```

## 文件说明

在基础镜像中存在如下4个文件（部分环境只有前3个）

### /entrypoint.sh

容器创建后首个执行的程序，负责检测环境，初始化相关参数，拉起后续启动流程，一般来说该文件无须改动

### /flag.sh

负责处理flag存放逻辑，例如需要将flag写入文件或是写入db，具体可参考每个基础环境的example
如在Dockerfile中不进行COPY此文件，则flag将按照默认逻辑执行，即读取环境变量`FLAG`写入至`/flag`中

### /start.sh

负责处理自行安装的程序如何启动，例如 `redis-server`等，需要注意启动应当为后台启动（即在命令末尾加上&），防止卡主后续内置应用的启动过程

```bash
#!/bin/bash
/usr/bin/redis-server &
```

### /run.sh

在pwn题中负责每次连接建立后处理的过程

## 启动顺序

所有环境遵循如下启动顺序

```plain
┌──────────────────┐
│  /entrypoint.sh  │
└────────┬─────────┘
         │
┌────────▼─────────┐
│     /flag.sh     │
└────────┬─────────┘
         │
┌────────▼─────────┐
│    /start.sh     │
└────────┬─────────┘
         │
┌────────▼─────────┐
│    Every Link    ◄──┐
└────────┬─────────┘  │
         │            │
┌────────▼─────────┐  │
│     /run.sh      ├──┘
└──────────────────┘
```
