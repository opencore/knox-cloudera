#!/usr/bin/env bash

export GATEWAY_HOME="${CONF_DIR}"
export GATEWAY_LOG_OPTS="-Dlog4j.configuration=${CONF_DIR}/log4j.properties"
export GATEWAY_JAVA_OPTS="${CSD_JAVA_OPTS}"

echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "KNOX_HOME: $KNOX_HOME"
echo "GATEWAY_HOME: $GATEWAY_HOME"
echo "GATEWAY_DATA_HOME: $GATEWAY_DATA_HOME"
echo "GATEWAY_CONF_HOME: $GATEWAY_CONF_HOME"
echo "KNOX_PRINCIPAL: $KNOX_PRINCIPAL"
echo "CSD_JAVA_OPTS: $CSD_JAVA_OPTS"
echo ""

# Generate JAAS config file
if [[ ${KERBEROS_AUTH_ENABLED} == "true" ]]; then
  KEYTAB_FILE="$CONF_DIR/fknox.keytab"
  JAAS_FILE="$CONF_DIR/krb5JAASLogin.conf"

  sed -i "s|REPLACEME|$JAAS_FILE|g" "$CONF_DIR/conf/gateway-site.xml"
  JAAS_CONFIG="
com.sun.security.jgss.initiate {
  com.sun.security.auth.module.Krb5LoginModule required
  renewTGT=true
  doNotPrompt=true
  useKeyTab=true
  keyTab=\"$KEYTAB_FILE\"
  principal="$KNOX_PRINCIPAL"
  isInitiator=true
  storeKey=true
  useTicketCache=true
  client=true;
};"
  echo "$JAAS_CONFIG" > $JAAS_FILE
fi

exec $KNOX_HOME/bin/gateway.sh start