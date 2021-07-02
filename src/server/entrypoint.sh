#! /bin/sh

cp /resources/paper.jar /server/paper.jar

cd /server

if test -f /server/eula.txt; then
	sed -i "s/eula=false/eula=true/g" /server/eula.txt
fi

java -Xms"${JVM_XMS}" -Xmx"${JVM_XMX}" -jar paper.jar -nogui
