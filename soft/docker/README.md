

# 安装

## CentOS

```bash
# 如果有老版本，则先删除
yum remove docker \
    docker-common \
    container-selinux \
    docker-selinux \
    docker-engine

yum install -y yum-utils

# 本地追加 docker 的 yum 仓库配置文件 (/etc/yum.repos.d/ 目录下)
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# 更新 yum 本地索引
yum makecache fast

# 安装 社区版
yum install docker-ce

docker --verion
```

# 参考
* [Install Docker](https://docs.docker.com/engine/installation/)


# 阿里云 docker 仓库镜像 加速

## ubuntu

```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://cbnwh58y.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## centos

```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://cbnwh58y.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## Mac

```text
桌面窗口顶部状态栏 : 点击 Docker 图标 : 点击 "Preferences..." 菜单 
    : 选择 "Daemon" 标签页
    : 选择 "Advanced" 子标签页
    : 输入一下配置 （JSON）
    
{
  "registry-mirrors" : [
    "https://cbnwh58y.mirror.aliyuncs.com"
  ]
}
```

# 阿里云 docker 仓库镜像 获取私有镜像

```bash

#-------------------------- 以下配置三选一
# 阿里云 docker 公网
export DOCKER_REG=registry.cn-hangzhou.aliyuncs.com
# 阿里云 docker 内网 - 经典网络
export DOCKER_REG=registry-internal.cn-hangzhou.aliyuncs.com
# 阿里云 docker 内网 - VPC网络
export DOCKER_REG=registry-vpc.cn-hangzhou.aliyuncs.com

# 1. 登录
docker login                                    \
    ${DOCKER_REG}                               \
    --username "admin@test.net"             \
    --password "xxxxx"

# 2. 使用私有镜像 ( docker pull/create/run )

docker pull                                     \
    ${DOCKER_REG}/test/my-nginx
```

 




