#!/bin/bash

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

# 安装 git
yum install -y git


# 对当前用户 root 进行全局配置
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --global push.default simple
git config --global core.filemode false
git config --global color.ui auto
git config --global branch.autosetuprebase always
git config --global credential.helper cache
git config --global core.quotepath false
git config --global core.ignorecase false

git config --list

