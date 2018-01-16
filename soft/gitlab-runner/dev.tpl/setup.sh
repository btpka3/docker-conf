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
    --restart always                                \
    -v ${DIR_CONF}/conf:/etc/gitlab-runner          \
    -v /var/run/docker.sock:/var/run/docker.sock    \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    gitlab/gitlab-runner:latest

docker start ${APP_C}


