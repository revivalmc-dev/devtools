FROM		alpine:3.14

ARG			PAPERMC_JAR=https://papermc.io/api/v2/projects/paper/versions/1.17/builds/69/downloads/paper-1.17-69.jar

RUN			apk upgrade -U && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk16-jre

WORKDIR		/resources

RUN			wget "${PAPERMC_JAR}" -O paper.jar

COPY		./entrypoint.sh /entrypoint.sh

ENV			JVM_XMS=2G	\
			JVM_XMX=4G

ENTRYPOINT	[ "sh", "/entrypoint.sh" ]
