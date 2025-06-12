#!/bin/sh
set -e

# Substitute environment variables in the template
envsubst '${WEB_URL} ${API_URL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start nginx
exec nginx -g 'daemon off;' 