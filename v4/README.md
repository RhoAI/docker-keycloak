# Docker KeyCloak

This image will is to be used along side a Keycloak server deployment.
When mounted with the same volume as the Keycloak container, this container
will sync themes from an AWS S3 bucket on cron job every 1 minute.

## Building the image

Clone the repository

        git clone https://github.com/RhoAI/docker-keycloak.git
        cd docker-keycloak
        ./build.sh

The default tag for the new image is rhoai/keycloak. If you want to specify a different tag, pass the -t flag along with the tag name:

        ./build.sh -t new/tag

## Environment Variables

The image requires a few environment variables in order to function properly.

### S3_BUCKET
This variable sets the bucket name to pull keycloak themes from.

### AWS_ACCESS_KEY_ID
This variable sets the access key with permission to read from `S3_BUCKET`. 

### AWS_SECRET_ACCESS_KEY
This variable sets the secret access key with permission to read from `S3_BUCKET`

## License
See the [license](../LICENSE) file.

## Contributers

* [Gilman Callsen](https://github.com/gcallsen)
* [Anthony Alves](https://github.com/while-loop)
