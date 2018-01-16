#!/bin/bash


CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

mkdir -p "${DIR_STORE}"
mkdir -p "${DIR_STORE_LOGS}"
mkdir -p "${DIR_STORE_HTML}"

docker stop ${APP_C}
docker rm ${APP_C}

#docker rmi ${APP_C}
#docker build -t ${APP_C} ./docker

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -p 80:80                                        \
    -p 443:443                                      \
    -v ${DIR_CONF}/conf:/etc/nginx:ro               \
    -v ${DIR_STORE_HTML}:/usr/share/nginx/html:ro   \
    -v ${DIR_STORE_LOGS}:/var/log/nginx:rw          \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    -v ${DIR_WORK}:${DIR_WORK}                      \
    ${APP_C}

docker start ${APP_C}

docker exec -it ${APP_C}                            \
    ${DIR_CONF}/docker/setup.sh

