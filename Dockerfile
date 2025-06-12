FROM nginx:alpine

# Copy custom nginx configuration template
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Add entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Expose the port nginx will listen on
EXPOSE 3000

ENV WEB_URL=web:4000
ENV API_URL=api:8080

ENTRYPOINT ["/docker-entrypoint.sh"] 