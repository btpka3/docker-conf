#!/bin/bash


CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

mkdir -p "${DIR_STORE}"
mkdir -p "${DIR_STORE_LOGS}"
mkdir -p "${DIR_STORE_DATA}"

docker stop ${APP_C}
docker rm ${APP_C}

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -p 8081:8081                                    \
    -v ${DIR_STORE_DATA}:/nexus-data                \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    shifudao/nexus3

docker start ${APP_C}

sleep 1
# FIXME 安装 bash 先
docker exec -it ${APP_C} ${DIR_CONF}/docker/setup.sh


