FROM python:3.7-slim

# Ensure Cron and AWS CLI tool are available
RUN apt-get update && apt-get -y install cron awscli

# Make a new /bin/rho directory
RUN mkdir /bin/rho

# Add the script responsible for syncing themes from S3 down to the container
ADD sync_themes.sh /bin/rho/sync_themes.sh
ADD docker-entrypoint.sh /bin/rho/docker-entrypoint.sh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/theme-sync

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/theme-sync

# Apply cron job
RUN crontab /etc/cron.d/theme-sync

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD ["/bin/rho/docker-entrypoint.sh"]
