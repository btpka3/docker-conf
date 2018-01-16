#!/bin/bash

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

# 创建自定义网络
docker network create --driver overlay my-net

# 阿里云 docker 仓库
docker login                                    \
    ${DOCKER_REG}                               \
    --username "u@main.net"             \
    --password "xxxxxxxxxx"
