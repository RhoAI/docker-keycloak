#!/bin/bash

# Download all themes in our S3 bucket
echo "Sync all themese from S3 ..."
aws s3 sync s3://temp-rho-theme  /opt/jboss/keycloak/themes/

# Go to our themes directory
cd /opt/jboss/keycloak/themes
DIRECTORY=$(pwd)
echo "Now in $DIRECTORY"

# Find all new `*.zip` files and unzip with `-o` flag to overrite existing.
# delete zip after unzipped.
for f in $DIRECTORY/*.zip; do
  echo "Unzipping and overwriting $i"
  unzip -o $f
  echo "Removing $i"
  rm $f
done