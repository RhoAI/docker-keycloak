FROM jboss/keycloak:4.8.3.Final

# Use root
USER root

# Ensure AWS CLI tool is available
RUN yum -y install awscli

# Add aws credentials required to use the CLI. These are expected to be
# available in build context in a file `.aws_credentials` in correct format.
RUN mkdir /opt/jboss/.aws
ADD .aws_credentials /opt/jboss/.aws/credentials

# Make a new /bin/rho directory
RUN mkdir /bin/rho

# Add the script responsible for syncing themes from S3 down to the container
ADD sync_themes.sh /bin/rho/sync_themes.sh

# Use jboss user again.
USER jboss
