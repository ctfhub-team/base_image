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

## 启动顺序

所有环境遵循如下启动顺序

1. 创建容器
2. 执行`/flag.sh`，可被覆盖，处理flag存放逻辑
3. 执行`/start.sh`，可被覆盖，处理单独安装的应用如何启动，启动应当都为后台启动，防止卡住后续的内置应用
4. 执行内置应用(httpd，nginx，mysql，xinetd，socat，python等)
