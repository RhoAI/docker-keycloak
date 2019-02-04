#!/bin/bash

#crond restart

# Download all themes in our S3 bucket
echo "Sync all themes from S3 ..."
# TODO make bucket set from environment
# consider if the aws profile should be able to be overriden as well, is it
# possible we'd want more than one profile?
# TODO make this the shared volume path
aws s3 sync s3://temp-rho-theme /bin/rho/themes/

echo "Sync complete ..."

# # Go to our themes directory
# cd /opt/jboss/keycloak/themes
# DIRECTORY=$(pwd)
# echo "Now in $DIRECTORY"
#
# # Find all new `*.zip` files and unzip with `-o` flag to overrite existing.
# # delete zip after unzipped.
# for f in $DIRECTORY/*.zip; do
#   echo "Unzipping and overwriting $i"
#   unzip -o $f
#   echo "Removing $i"
#   rm $f
# done
