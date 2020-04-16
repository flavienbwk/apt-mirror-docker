# apt-mirror-docker

<p align="center">
    <a href="https://travis-ci.org/flavienbwk/apt-mirror-docker.svg?branch=master" target="_blank">
        <img src="https://travis-ci.org/flavienbwk/apt-mirror-docker.svg?branch=master"/>
    </a>
</p>
<p align="center">Updated and portable apt-mirror script including the most recent pull requests, containerized for mirroring + serving</p>

This repository merges [geosone's](https://github.com/geosone/apt-mirror) and [liedekef's](https://github.com/liedekef/apt-mirror) updates from the (sadly) unmaintained [apt-mirror repository](https://github.com/apt-mirror/apt-mirror)

## Downloading & updating

1. Edit the `mirror.list` file at your convenience

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

## Serving

1. Check your mirroring succeeded checking `./mirror/mirror/*`

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

> Feel free to add a reverse proxy or update the [nginx configuration file](./nginx.conf) to secure the mirror with SSL/TLS  
> Feel free to send **pull requests** as well !
