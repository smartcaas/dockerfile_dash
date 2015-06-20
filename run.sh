#!/bin/bash
require_env=(
MYSQL_PORT_3306_TCP_ADDR
DB_NAME
DB_USER
DB_PWD
MEMCACHED_PORT_11211_TCP_ADDR
MEMCACHED_PORT_11211_TCP_PORT
UIC_URL
UIC_TOKEN
BUILDER_URL
SERVER_URL
DOMAIN
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
configFile=${APP_DIR}/dash/web/WEB-INF/config.txt
sed -i "s/{DB_HOST}/${MYSQL_PORT_3306_TCP_ADDR}/g" $configFile \
&& sed -i "s/{DB_NAME}/${DB_NAME}/g" $configFile \
&& sed -i "s/{DB_USER}/${DB_USER}/g" $configFile \
&& sed -i "s/{DB_PWD}/${DB_PWD}/g" $configFile \
&& sed -i "s/{UIC_TOKEN}/${UIC_TOKEN}/g" $configFile \
&& sed -i "s/{MC_ADDR}/${MEMCACHED_PORT_11211_TCP_ADDR}:${MEMCACHED_PORT_11211_TCP_PORT}/g" $configFile
catalina.sh run
