#! /bin/sh

# Compile a Minecraft plugin inside a docker container to avoid installing
# compatible build tools on the host system and create conflicts.

printf "Building pluginbuilder image...\n"
docker build ./src/pluginbuilder -t revivalmc-dev/pluginbuilder > /dev/null

# $1 -> path to plugin source (build system must be maven)

if [ $# -eq 0 ]; then
	printf "Usage: pluginbuilder <path/to/plugin>\n"
	exit 1
fi

plugindir=$1
shift

docker run -v$PWD/.m2:/root/.m2 -v$PWD/$plugindir:/usr/src/plugin -it revivalmc-dev/pluginbuilder $@
