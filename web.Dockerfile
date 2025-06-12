FROM briefercloud/briefer-web

# Update start.sh to use IPv6 (HOSTNAME=::)
RUN sed -i 's/HOSTNAME=0.0.0.0/HOSTNAME=::/g' ./apps/web/start.sh

CMD ./apps/web/start.sh 