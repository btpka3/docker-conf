#!/bin/bash


CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${CUR_DIR}/env.sh"

mkdir -p "${DIR_STORE}"
mkdir -p "${DIR_STORE_DATA}"

docker stop ${APP_C}
docker rm ${APP_C}

#docker rmi ${APP_C}
#docker build -t ${APP_C} ./docker

docker create                                       \
    --name ${APP_C}                                 \
    --restart unless-stopped                        \
    -p 5432:5432                                    \
    -e POSTGRES_PASSWORD=postgres                   \
    -v ${DIR_STORE_DATA}:/var/lib/postgresql/data:rw\
    -v ${DIR_CONF}:${DIR_CONF}                      \
    postgres:9.6.4-alpine

docker start ${APP_C}

docker exec -it ${APP_C}                            \
    ${DIR_CONF}/docker/setup.sh

