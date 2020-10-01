FROM openjdk:8-alpine

LABEL maintainer "baschtie"

ENV SPIGOT_VERSION=latest

ENV MEMORY=1024M

RUN apk add --no-cache \
    git

RUN adduser java --system

WORKDIR /buildtools

RUN chown java /buildtools

USER java

RUN mkdir ./output

ENTRYPOINT  wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
            java -Xmx$MEMORY -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar BuildTools.jar --rev $SPIGOT_VERSION && \
            mv ./spigot-*.jar ./output/
