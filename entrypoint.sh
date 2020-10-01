#!/bin/sh
wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

java -Xmx$MEMORY -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar BuildTools.jar --rev $SPIGOT_VERSION

mv ./spigot-*.jar ./output/