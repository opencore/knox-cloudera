#!/usr/bin/env bash

GATEWAY_CONF_HOME="$1"
GATEWAY_DATA_HOME="$2"

echo "cp -R $KNOX_HOME/conf.org/* $GATEWAY_CONF_HOME/"
cp -R "$KNOX_HOME/conf.org/"* "$GATEWAY_CONF_HOME/"

echo "cp -R $KNOX_HOME/data/* $GATEWAY_DATA_HOME/"
cp -R "$KNOX_HOME/data/"* "$GATEWAY_DATA_HOME/"
