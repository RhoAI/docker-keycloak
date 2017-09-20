FROM jboss/keycloak-mysql:3.2.1.Final

ADD jgroup.xslt /opt/jboss/keycloak/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/keycloak/jgroup.xslt -o:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml; 

ADD jgroups-module.xml keycloak/modules/system/layers/base/org/jgroups/main/module.xml

USER root
RUN yum install -y xmlstarlet

USER jboss
RUN xmlstarlet ed --inplace \
    -N x="urn:jboss:domain:undertow:3.0" \
    -a "//x:http-listener" \
    -t attr \
    -n 'proxy-address-forwarding' \
    -v 'true' \
    /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

RUN xmlstarlet ed --inplace \
    -N x="urn:jboss:domain:undertow:3.0" \
    -s "//x:host" \
    -t elem \
    -n 'access-log' \
    -v '' \
    -i '$prev' \
    -t attr \
    -n 'use-server-log' \
    -v 'true' \
    -a "//x:host/access-log" \
    -t attr \
    -n 'pattern' \
    -v 'common' \
    /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

RUN xmlstarlet ed --inplace \
    -N x="urn:jboss:domain:keycloak-server:1.1" \
    -s "//x:providers" \
    -t elem \
    -n 'provider' \
    -v 'module:ai.rho.hashprovider' \
    /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

ADD docker-entrypoint.sh /opt/jboss/

RUN mkdir -p /opt/jboss/keycloak/modules/ai/rho/hashprovider/main
ADD hash-module.xml /opt/jboss/keycloak/modules/ai/rho/hashprovider/main/module.xml
ADD password-hash.jar /opt/jboss/keycloak/modules/ai/rho/hashprovider/main

CMD ["--server-config", "standalone-ha.xml"]
