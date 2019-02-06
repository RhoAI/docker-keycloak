#!/bin/bash

#crond restart
source /bin/rho/project_env.sh
[ -z "${S3_BUCKET}" ] && { echo "=> S3_BUCKET cannot be empty" && exit 1; }
[ -z "${AWS_ACCESS_KEY_ID}" ] && { echo "=> AWS_ACCESS_KEY_ID cannot be empty" && exit 1; }
[ -z "${AWS_SECRET_ACCESS_KEY}" ] && { echo "=> AWS_SECRET_ACCESS_KEY cannot be empty" && exit 1; }

# Download all themes in our S3 bucket
echo "Sync all themes from S3 ..."
# TODO make bucket set from environment
# consider if the aws profile should be able to be overriden as well, is it
# possible we'd want more than one profile?
aws s3 sync s3://${S3_BUCKET} /opt/jboss/keycloak/themes

echo "Sync complete ..."
