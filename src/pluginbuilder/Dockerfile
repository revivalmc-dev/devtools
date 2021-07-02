FROM		alpine:3.14

RUN			apk upgrade -U && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk16 maven

COPY		./entrypoint.sh /entrypoint.sh

WORKDIR		/usr/src/plugin

ENTRYPOINT	[ "mvn", "package" ]
