#!/bin/sh

# pass env vars to cron task
printenv | sed 's/^\(.*\)$/export \1/g' > /bin/rho/project_env.sh

/bin/rho/sync_themes.sh

cron && tail -f /var/log/cron.log
