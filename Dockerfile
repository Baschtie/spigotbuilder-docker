FROM ubuntu:latest

LABEL maintainer "github.com/baschtie"

ENV TZ=Europe/Berlin

ENV SPIGOT_VERSION=latest

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y \
    git \
    openjdk-11-jre \
    wget

RUN adduser java --system

WORKDIR /buildtools

RUN chown java /buildtools

USER java

RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

RUN mkdir ./build-output

#RUN git config --global --unset core.autocrlf

# VOLUME ["./build-output"]

CMD java -jar BuildTools.jar --rev $SPIGOT_VERSION \
    && mv ./spigot-*.jar ./build-output/
