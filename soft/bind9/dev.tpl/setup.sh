#!/bin/bash

# https://hub.docker.com/r/resystit/bind9/

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

docker stop ${APP_C}
docker rm ${APP_C}

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -p 53:53                                        \
    -p 53:53/udp                                    \
    -v /data0/conf/soft/bind9/dev.tpl/docker/named.conf:/etc/bind/named.conf    \
    -v /absolute/path/exemple.com.db:/etc/bind/exemple.com.db                   \
    -v ${DIR_CONF}:${DIR_CONF}                                                  \
    resystit/bind9:latest

docker start ${APP_C}



