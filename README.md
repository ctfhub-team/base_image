# CTFHub 基础环境仓库

各个环境说明请进入对应目录查看

## 镜像拉取

镜像存放地址:
1. `registry.cn-hangzhou.aliyuncs.com`
2. `dockerhub`

镜像命名空间: `ctfhub_base`

例如，要拉取web_httpd_php_5.6，则完整的pull命令如下
```bash
# 从dockerhub拉取
docker pull ctfhub_base/web_httpd_php_5.6

# 从阿里云拉取
docker pull registry.cn-hangzhou.aliyuncs.com/ctfhub_base/web_httpd_php_5.6
```