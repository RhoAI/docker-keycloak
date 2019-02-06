# Docker KeyCloak

Docker image to run a KeyCloak cluster. This is a modified copy of [keycloak-mysql 3.2.1](https://hub.docker.com/r/jboss/keycloak-mysql/) that has been configured to run KeyCloak clusters on a cloud-based infrastructure (eg AWS).

The clustering configuration has been modified to use the JDBC_PING protocol instead of the default multicast protocol, so that clustering will work in cloud-based environments that do not support multicast communication. It has also been configured to work behind a load balancer.

In addition to the original functionality, this image includes the option to use bcrypt for hashing passwords, request logging, and an optional replicated session cache. The image is also able to run on Rancher.

## Building the image

Clone the repository

        git clone https://github.com/RhoAI/docker-keycloak.git
        cd docker-keycloak
        ./build.sh

The default tag for the new image is rhoai/keycloak. If you want to specify a different tag, pass the -t flag along with the tag name:

        ./build.sh -t new/tag

## Environment Variables

The image requires a few environment variables in order to function properly.

### MYSQL_PORT_3306_TCP_ADDR
This variable sets the address of the shared MySQL database.

### MYSQL_PORT_3306_TCP_PORT
This variable sets the port of the shared MySQL database. 

### MYSQL_DATABASE
This variable sets the name of the KeyCloak database.

### MYSQL_USERNAME
This variable sets the username for the KeyCloak database user.

### MYSQL_PASSWORD
This variable sets the password for the KeyCloak database user.

### REPLICATE_SESSIONS_ALL
This variable controls the configuration of the KeyCloak session cache. If set to 'true', the session cache is replicated across all nodes in the cluster. The default uses a distributed session cache with 2 owners.

### USE_RANCHER_IP
This variable controls whether the image will execute in the context of a rancher server.

## License
See the license file.

## Contributers

* [Kellen Stephens](https://github.com/kstephens-)
