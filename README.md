# arch-empyrion-headless

ArchLinux based docker image with wine and vnc support, supports running Windows applications by using Wine. 
SteamCMD command line utilities added as well as functionality to install an empyrion galactic survival dedicated server.

This project is hosted at https://github.com/fateinabox/arch-empyrion-headless

This project has been forked from Toetje585/arch-wine-vnc hosted at https://github.com/wine-gameservers/arch-wine-vnc

# Table of contents
<!-- vim-markdown-toc GFM -->
* [Deployment](#deployment)
	* [Deploying with docker run](#docker-run)
	* [Deploying with docker-compose](#docker-compose)
<!-- vim-markdown-toc -->
# Deployment
# Docker run
```
$ docker run -d \
    --name arch-empyrion-headless \
    -e VNC_PASSWORD=winevnc \
    -p 5900:5900/tcp \ 
    -v /path/to/application:/opt/applicationname \
    -v /etc/localtime:/etc/localtime:ro \
    -e PUID=<UID from user> \
    -e PGID=<GID from user> \
    fateinabox/arch-empyrion-headless
```
# Docker compose
```
services:
  arch-empyrion-headless:
    image: fateinabox/arch-empyrion-headless:latest
    container_name: arch-empyrion-headless
    environment:
      - VNC_PASSWORD=winevnc
      - PUID=<UID from user>
      - PGID=<GID from user>
    volumes:
      - /path/to/application:/opt/applicationname
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 5900:5900/tcp
```

# Notes:

13-05-2024: Rebuild image to update wine and other packages
