#!/usr/bin/env bash

GATEWAY_CONF_HOME="$1"

echo "cp -R $KNOX_HOME/conf.org/* $GATEWAY_CONF_HOME/"
cp -R "$KNOX_HOME/conf.org/"* "$GATEWAY_CONF_HOME/"