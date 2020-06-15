# Release Notes

## v6.0.1-0.6.1 (2020-06-15)
* Add  --exact-timestamps flag to aws sync to ensure files with same size but different timestamps are copied

## v6.0.1-0.6.0 (2019-02-06)
* Add `--delete` flag to sync so the container will clean up any deleted themes.
* Bump keycloak version as v6 is now in production.

## v4.8.3-0.5.0 (2019-02-06)
* Create sidecar container to sync themes with Keycloak via AWS S3 bucket

## v3.2.1-0.4.0 (2017-11-27)
* Functionality for searching for users by group based on custom attributes.

## v3.2.1-0.3.0 (2017-11-05)
* GroupUser Resource: retrieve users by group name, retrieve count of users by
group name, and add a user to a group by group name.
* Resources for creating a reset password key and validating a reset password key.

## v3.2.1-0.2.0
* Resource for retrieving users by client role, retrieving count of users by
client role.

## v3.2.1-0.1.0
* SPI for supporting bcrypt password hashes.
* Initial release.
