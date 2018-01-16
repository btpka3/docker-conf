#!/bin/sh

# FIXME install bash
echo "docker inner setup"

# 方便登录 docker 容器后直接使用 bash 并初始化相关环节变量
cat >~/.bashrc <<EOF
. /etc/profile
EOF

cp /data0/conf/soft/sonarqube/dev.tpl/docker/env.sh /etc/profile.d/

