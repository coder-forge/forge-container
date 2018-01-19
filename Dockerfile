FROM nginx:alpine

# setup nginx
COPY config/nginx.vh.default.conf /etc/nginx/conf.d/default.conf

# setup sftp
# @author: https://raw.githubusercontent.com/atmoz/sftp/alpine/entrypoint
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache bash shadow@community openssh openssh-sftp-server && \
    sed -i 's/GROUP=1000/GROUP=100/' /etc/default/useradd && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY config/sshd_config /etc/ssh/sshd_config
COPY bin/startSftp.sh /entrypoint
COPY bin/start.sh /start
RUN chmod +x /entrypoint /start

EXPOSE 80
EXPOSE 22

CMD ["/start"]
