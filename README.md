# OpenTDM-docker


Dockerized Quake II OpenTDM server. 

## Prerequisites

- GNU/Linux.
- Docker.
- Firewall rules allowing inbound connections to ports being used (i.e. 27910 UDP) 

## Basic Usage

The docker image runs a q2pro dedicated server on internal port `27910`, published port must be specified on `docker run` command as follows:

`# docker run -d -p 27910:27910/udp invch/opentdm-docker`

Normally you wouldn't need to change the net_port cvar, since the published port is managed by docker. Anyway, it can be set via environment variables.

Multiple instances can be run specifying different published ports.

`# docker run -d -p 27920:27910/udp invch/opentdm-docker`

`# docker run -d -p 27930:27910/udp invch/opentdm-docker`

## Environment Variables

Common server cvars can be set as environment variables. 

**Example:** 

|CVAR|ENV|Default Value
|----|---|---|
|sv_anticheat_required|SV_ANTICHEAT_REQUIRED|1|

Environment variables can be passed individually to the `docker run` command:

`# docker run -d -p 27910:27910/udp --env SV_ANTICHEAT_REQUIRED=0 invch/opentdm-docker`

Or can be specified by env-file:

`# docker run -d -p 27910:27910/udp --env-file ./env.list invch/opentdm-docker`


## Available CVARS

All available cvars are listed in the example [env.list](https://github.com/jocarren/opentdm-docker/blob/master/env.list) environment file.

## Acknowledgments

- Andrey Nazarov (skullernet) for his q2pro client and opentdm fork http://skuller.net/
- Richard Stanway (r1ch) for his opentdm Quake2 team deathmatch mod https://r1ch.net/
- John Carmack and the Id Software team, for releasing the q2 source code under GPL licence.
