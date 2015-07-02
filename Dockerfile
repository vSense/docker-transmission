FROM alpine:3.1

MAINTAINER Romain Guichard <rguichard@vsense.fr>

RUN apk --update add \
    transmission-daemon \
    supervisor
RUN adduser -D -h / -s /bin/sh -u 7001 media && \
    mkdir -p /etc/transmission-daemon /download && \
    chown -R media:media /etc/transmission-daemon/

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisord-transmission.ini /etc/supervisor.d/supervisord-transmission.ini

VOLUME ["/download"]

WORKDIR /

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]

EXPOSE 9091 12345
