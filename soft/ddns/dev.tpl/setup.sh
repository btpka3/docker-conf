#!/bin/bash


CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

docker stop ${APP_C}
docker rm ${APP_C}

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    my-ddns                  \
    ${DIR_CONF}/docker/start.sh

docker start ${APP_C}



