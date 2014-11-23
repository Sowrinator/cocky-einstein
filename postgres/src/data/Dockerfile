# Custom container for storage and backup of Postgres data

FROM busybox:ubuntu-14.04


RUN mkdir -p /var/lib/postgresql &&\
    mkdir -p /var/log/postgresql

VOLUME ["/var/log/postgresql", "/var/lib/postgresql"]