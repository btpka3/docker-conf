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
    -p 9000:9000                                    \
    -p 9092:9092                                    \
    -e SONARQUBE_JDBC_USERNAME=sonar                \
    -e SONARQUBE_JDBC_PASSWORD=sonar                \
    -e SONARQUBE_JDBC_URL=jdbc:postgresql://192.168.0.41/sonar \
    -v ${DIR_STORE_DATA}:/opt/sonarqube/data:rw     \
    -v ${DIR_CONF}:${DIR_CONF}                      \
    sonarqube:lts-alpine

docker start ${APP_C}

docker exec -it ${APP_C}                            \
    /data0/conf/soft/sonarqube/dev.tpl/docker/setup.sh

