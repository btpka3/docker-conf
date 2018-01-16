#!/bin/bash

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

# 不使用符号链接，防止获取文件路径时出错，并方便只修改一处脚本。
cat >/etc/profile.d/env.sh <<EOF
. ${DIR_CONF}/docker/env.sh
EOF


fc-cache -fv
#fc-list | sort
