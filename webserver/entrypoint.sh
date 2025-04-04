#!/bin/sh
# Replace env vars in template and start nginx
envsubst '$NGINX_SERVER_NAME' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'
