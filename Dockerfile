FROM library/haproxy:alpine   
  
COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg   
   
RUN apk add --no-cache curl   
   
ENTRYPOINT [ "sh", "-c", "haproxy -f /usr/local/etc/haproxy/haproxy.cfg"]   
