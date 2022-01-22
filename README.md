# apt-mirror-docker

<p align="center">
    <a href="https://travis-ci.com/flavienbwk/apt-mirror-docker.svg?branch=master" target="_blank">
        <img src="https://travis-ci.com/flavienbwk/apt-mirror-docker.svg?branch=master"/>
    </a>
</p>
<p align="center">Up to date apt-mirror script, containerized for mirroring + serving.</p>

This repository merges [geosone's](https://github.com/geosone/apt-mirror) and [liedekef's](https://github.com/liedekef/apt-mirror) updates from the (sadly) unmaintained [apt-mirror repository](https://github.com/apt-mirror/apt-mirror)

<p align="center">Status : tested & working :heavy_check_mark:</p>

## To know

An Ubuntu archive mirror may **[update every 6 hours](https://wiki.ubuntu.com/Mirrors)** (4 times a day, timezone depending on mirror's location). To avoid a bad sync, launch sync of your mirror ~15 minutes after midnight, 6am, noon or 6pm (consider mirror's timezone).

That is to say your download time shoudln't exceed 6 hours to be safe : that's why I recommended using [a cloud provider](https://scaleway.com) for download and then retrieve it with `rsync` for example.

## Downloading & updating

1. Edit the `mirror.list` file at your convenience

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

> This repository is shipped with the Ubuntu 18.04 default `mirror.list` (expect ~210Gb to be downloaded)

## Serving

1. Check your mirroring succeeded in `./mirror/mirror/*` or typing `du -sh ./mirror`

    You are expected to download around **210 Gb** of files at the time of writing.

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

:point_right: Feel free to add a reverse proxy or update the [nginx configuration file](./nginx.conf) to secure the mirror with SSL/TLS  
:point_right: Feel free to send **pull requests** as well !
