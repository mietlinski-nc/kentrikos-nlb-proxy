FROM library/haproxy:alpine

COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENTRYPOINT [ "sh", "-c", "/sbin/syslogd -O /dev/stdout && haproxy -f /usr/local/etc/haproxy/haproxy.cfg"]
