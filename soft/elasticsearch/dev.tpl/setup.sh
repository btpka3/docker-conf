#!/bin/bash


CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

mkdir -p "${DIR_STORE}"
mkdir -p "${DIR_STORE_DATA}"

docker stop ${APP_C}
docker rm ${APP_C}

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -p 9200:9200                                    \
    -p 9300:9300                                    \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    elasticsearch:2.4.5-alpine


#    -v ${DIR_STORE_DATA}:/usr/share/elasticsearch/data:rw   \
#    -v ${DIR_CONF}/docker/config:/usr/share/elasticsearch/config \

docker start ${APP_C}

docker exec -it ${APP_C}                            \
    /data0/conf/soft/elasticsearch/dev.tpl/docker/setup.sh

