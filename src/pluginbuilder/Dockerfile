FROM		alpine:3.14

ARG			PAPER_API=https://papermc.io/repo/repository/maven-public/

RUN			apk upgrade -U && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk16 maven

WORKDIR		/tmp

COPY		./entrypoint.sh /entrypoint.sh

WORKDIR		/usr/src/plugin

ENTRYPOINT	[ "mvn", "package" ]
