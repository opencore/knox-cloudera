#!/usr/bin/env bash

export GATEWAY_HOME="${CONF_DIR}"
export GATEWAY_LOG_OPTS="-Dlog4j.configuration=${CONF_DIR}/log4j.properties"

echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "KNOX_HOME: $KNOX_HOME"
echo "GATEWAY_HOME: $GATEWAY_HOME"
echo "GATEWAY_DATA_HOME: $GATEWAY_DATA_HOME"
echo "GATEWAY_CONF_HOME: $GATEWAY_CONF_HOME"
echo ""

cd $KNOX_HOME

# $KNOX_HOME/bin/knoxcli.sh create-master --master "$1"

exec $KNOX_HOME/bin/gateway.sh start