# alpine-mirror-docker

<p align="center">
    <a href="https://travis-ci.com/flavienbwk/alpine-mirror-docker.svg?branch=master" target="_blank">
        <img src="https://travis-ci.com/flavienbwk/alpine-mirror-docker.svg?branch=master"/>
    </a>
</p>
<p align="center">Status : tested & working :heavy_check_mark:</p>

This repository refactors [victorb](https://github.com/victorb/alpine-mirror)'s `mirror.sh` script

## Downloading & updating

1. Setup your Alpine version and releases in `mirror.sh`

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

> Tips: We recommend you downloading the mirror from [a cloud provider](https://www.scaleway.com/en/) and then transfer the files to your computer.

## Serving

1. Check your mirroring succeeded in `./mirror/*` or typing `du -sh ./mirror` to check the volume

    The default configuration should make you download _47G_

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

## Client configuration

To point your Alpine clients to your mirror, update their `/etc/apk/repositories` file as follow :

```txt
http://localhost:8080/v3.13/main
http://localhost:8080/v3.13/community
```

:point_right: Feel free to add a reverse proxy or update the [nginx configuration file](./nginx.conf) to secure the mirror with SSL/TLS  
:point_right: Feel free to send **pull requests** as well !
