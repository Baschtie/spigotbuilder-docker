FROM openjdk:8-alpine

LABEL maintainer "baschtie"

ENV SPIGOT_VERSION=latest

ENV MEMORY=1024M

RUN apk add --no-cache \
    git

RUN adduser java --system

WORKDIR /buildtools

COPY ./entrypoint.sh entrypoint.sh

RUN chown -Rf java /buildtools && \
    chmod +x entrypoint.sh

USER java

RUN mkdir ./output

ENTRYPOINT ["/buildtools/entrypoint.sh"]
