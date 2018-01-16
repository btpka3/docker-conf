#!/bin/bash

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#echo "docker inner setup"

# 方便登录 docker 容器后直接使用 bash 并初始化相关环节变量
cat > ~/.bashrc <<EOF
. /etc/profile
EOF

cp ${CUR_DIR}/env.sh  /etc/profile.d/


