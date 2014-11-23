FROM debian:wheezy
MAINTAINER damien.duportal@gmail.com

ADD https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 /usr/local/bin/fig
RUN chmod +x /usr/local/bin/fig

# This container is a chrooted fig
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/fig"]
CMD ["--version"]