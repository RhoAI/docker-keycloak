#!/bin/bash

if [ $USE_RANCHER_IP == true ]; then
    # retrieve node identifier and external host ip from rancher metadata service

    NODE_SERVICE_NAME=$(curl http://rancher-metadata/2016-07-29/self/container/service_name)
    NODE_SERVICE_INDEX=$(curl http://rancher-metadata/2016-07-29/self/container/service_index)
    NODE_IDENTIFIER="${NODE_SERVICE_NAME}_${NODE_SERVICE_INDEX}"

    EXTERNAL_IP=$(curl http://rancher-metadata/2016-07-29/self/container/ips/0)
else
    # use node identifier and external ip of host

    NODE_IDENTIFIER=$HOSTNAME
    EXTERNAL_IP="$(hostname --all-ip-addresses | awk '{print $1}')"
fi

# export external host ip for keycloak cluster binding
export EXTERNAL_HOST_IP=$EXTERNAL_IP

# set session cache distribution level
if [ "$REPLICATE_SESSIONS_ALL" = "true" ]; then
    xmlstarlet ed --inplace \
        -N x="urn:jboss:domain:infinispan:4.0" \
        -r "//x:distributed-cache[@name='sessions']" \
        -v 'replicated-cache' \
        -d "//x:replicated-cache[@name='sessions']/@owners" \
        /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
else
    xmlstarlet ed --inplace \
        -N x="urn:jboss:domain:infinispan:4.0" \
        -u "//x:distributed-cache[@name='sessions']/@owners" \
        -v '2' \
        /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
fi

# start keycloak service 
exec /opt/jboss/keycloak/bin/standalone.sh -Djboss.node.name=$NODE_IDENTIFIER -Djgroups.bind_addr=global -b $HOSTNAME $@
exit $?