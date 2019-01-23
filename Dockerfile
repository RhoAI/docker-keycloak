FROM jboss/keycloak:4.8.3.Final

ADD docker-entrypoint.sh /opt/jboss/

ADD raincatcher-keycloak-theme/ /opt/jboss/keycloak/themes/

#RUN mkdir -p /opt/jboss/keycloak/modules/ai/rho/extensions/main
#ADD extensions-module.xml /opt/jboss/keycloak/modules/ai/rho/extensions/main/module.xml
#ADD extensions.jar /opt/jboss/keycloak/modules/ai/rho/extensions/main

#CMD ["--server-config", "standalone-ha.xml"]
