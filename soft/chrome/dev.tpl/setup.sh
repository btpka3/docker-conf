#!/bin/bash

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

docker stop ${APP_C}
docker rm ${APP_C}

mkdir -p "${DIR_STORE_LOGS}"
mkdir -p "${DIR_STORE_FONTS}"

# TODO 手动处理
:<<EOL
TODO
1. 从 test12:/data1/samba/share/share/my-fonts.tgz 解压到刚刚的目录中
EOL

docker create                                           \
    --name ${APP_C}                                     \
    --restart unless-stopped                            \
    -u root                                             \
    -w ${DIR_CONF}                                      \
    --expose 9222                                       \
    -p 19040:9222                                       \
    -v ${DIR_STORE_FONTS}:/usr/share/fonts/my-fonts     \
    -v ${DIR_STORE}:${DIR_STORE}:rw                     \
    -v ${DIR_CONF}:${DIR_CONF}                          \
    -i                                                  \
    -t                                                  \
    ${APP_C}

docker start ${APP_C}

sleep 1
# 一次性的初始化字体
docker exec -u root ${APP_C} bash -c ./docker/setup.sh


