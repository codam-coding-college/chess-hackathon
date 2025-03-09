FROM alpine:3.21.3

RUN set -x \
	    && apk update && apk upgrade \
	    && apk add openssh-server

RUN set -eux \
	    && mkdir /var/lib/jail		\
	    && mkdir -p /var/lib/jail/games	\
	    && mkdir -p /var/lib/jail/bots

RUN adduser -D -s /sbin/nologin -h /var/lib/jail filesrv filesrv

RUN set -eux \
	    && chmod -R 750 /var/lib/jail		\
	    && chown -R root:filesrv /var/lib/jail	\
	    && chmod 730 /var/lib/jail/games

COPY sshd_config /
COPY start.sh /

VOLUME /var/lib/jail/bots
VOLUME /var/lib/jail/games

ENTRYPOINT [ "/start.sh" ]
