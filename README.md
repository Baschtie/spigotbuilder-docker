# spigotbuilder

Uses Spigot Buildtools to build spigot.jar

### How to use
```
docker run --rm -v $(pwd)/output:/buildtools/output -e SPIGOT_VERSION=latest baschtie/spigotbuilder
```

### options

```--rm``` is used so the container will remove itself after it is done building

```-v $(pwd)/output:/buildtools/output``` mounts the folder ./output inside the container so the spigot.jar can be retrived afterwards

```-e SPIGOT_VERSION=latest``` can be used to select the prefered version to be build (e.g. latest , 1.16.3, 1.8.9, ...)

```-e MEMORY=1024M``` sets the available memory (needs to be at least 512M, recommended is 1024M)

```-it``` can be used so ```crtl + c``` works while the container is running

### about the image

Image is based on openjdk:8-alpine

With each run the latest version of BuildTools is retrived from [https://hub.spigotmc.org/jenkins/job/BuildTools](https://hub.spigotmc.org/jenkins/job/BuildTools)

Then the buildtools.jar is run & the resulting spigot.jar will be moved in the /buildtools/output directory (inside the container)

### Github

[https://github.com/Baschtie/spigotbuilder-docker/](https://github.com/Baschtie/spigotbuilder-docker/)
