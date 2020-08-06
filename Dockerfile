FROM ubuntu:latest
MAINTAINER Jonathan Carreño <jocarren@gmail.com>

#++++BEGIN SERVER COMMANDS AS ENVIRONMENT VARIABLES++++

#GENERAL
ENV NET_PORT="27910"
ENV GAME="opentdm"
ENV HOSTNAME="Quake 2 OpenTDM Server"
ENV MAXCLIENTS="32"
ENV DEATHMATCH="1"
ENV CHEATS="0"
ENV SV_IPLIMIT="0"

#RCON
ENV RCON_PASSWORD="purripurri"
ENV G_ADMIN_PASSWORD="purripurri"

#ANTICHEAT
ENV ANTICHEAT="0"
ENV SV_ANTICHEAT_REQUIRED="0"

#LOGS
ENV LOG_STATS="0"
ENV LOGFILE_NAME="opentdm.log"
ENV LOGFILE="3"
ENV LOGFILE_TIMESTAMP="1"

#GAME OPENTDM
ENV G_GAMEMODE="0"
ENV G_MATCH_TIME="600"      
ENV G_FAST_WEAP_SWITCH="0"
ENV G_OVERTIME="120"        
ENV G_MATCH_COUNTDOWN="11"  
ENV G_TIE_MODE="1"
ENV G_TELEPORTER_NOFREEZE="1"

#FLAGS OPENTDM
ENV G_TDMFLAGS="1040"
ENV G_ITDMFLAGS="142427"
ENV G_1V1FLAGS="1040"
ENV G_ITEMFLAGS="0"
ENV G_POWERUPFLAGS="0"

#TEAM OPENTDM
ENV G_TEAM_A_SKIN="female/athena"
ENV G_TEAM_B_SKIN="male/grunt"
ENV G_LOCKED_SKINS="1"
ENV G_TEAM_A_NAME="Team A"
ENV G_TEAM_B_NAME="Team B"
ENV G_LOCKED_NAMES="0"

#MISC
ENV G_INTERMISSION_TIME="5"
ENV G_TDM_ALLOW_PICK="1"
ENV G_ALLOW_VOTE_CONFIG="1"
ENV G_MOTD_MESSAGE="=========================\nQuake 2 OpenTDM Server\n========================="
ENV G_VOTE_TIME="90"
ENV G_CHAT_MODE="1"
ENV G_MAX_TIMEOUT="300"
ENV G_1V1_TIMEOUT="150"
ENV G_RESPAWN_TIME="5"
ENV G_IDLE_TIME="300"
ENV G_FORCE_SCREENSHOT="1"
ENV G_FORCE_RECORD="1"
ENV G_BUGS="0"
ENV G_ALLOW_NAME_CHANGE_DURING_MATCH="1"
ENV G_MAPLISTFILE="maps.lst"
ENV G_AUTO_REJOIN_MATCH="1"
ENV G_AUTO_REJOIN_MAP="1"
ENV G_MAX_PLAYERS_PER_TEAM="32"
ENV G_ADMIN_VOTE_DECIDE="1"
ENV G_1V1_SPAWN_MODE="1"
ENV G_TDM_SPAWN_MODE="1"
ENV G_VOTE_MASK="63"

#TAUNT FLOOD
ENV FLOOD_WAVES="0"
ENV FLOOD_WAVES_PERMINUTE="10"
ENV FLOOD_WAVES_WAITDELAY="0"

#HTTP
ENV G_HTTP_ENABLED="1"
ENV G_HTTP_BASE_URL="http://www.opentdm.net/api/"

#DEDICATED
ENV PUBLIC="1"
ENV SETMASTER="master.q2servers.com"

#DOWNLOAD
ENV ALLOW_DOWNLOAD="1"
ENV ALLOW_DOWNLOAD_MAPS="1"
ENV ALLOW_DOWNLOAD_SOUNDS="1"
ENV ALLOW_DOWNLOAD_MODELS="1"
ENV ALLOW_DOWNLOAD_PLAYERS="1"

#MVD
ENV SV_MVD_ENABLE="1"
ENV ADDGTVHOST=""

#MAP
ENV INITMAP="q2dm1"

#++++END SERVER COMMANDS AS ENVIRONMENT VARIABLES++++

#++++BEGIN DIRECORY AND EXECUTABLE BUILD++++

ADD . /opt/quake2
RUN useradd -m -s /bin/bash quake2
RUN chown -R quake2:quake2 /opt/quake2
RUN apt-get update
RUN apt-get install wget -y
RUN wget https://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/quake2
EXPOSE 27910/udp
EXPOSE 27910/tcp
EXPOSE 27920/tcp
EXPOSE 27920/udp
WORKDIR /opt/quake2
USER quake2
#++++END DIRECORY AND EXECUTABLE BUILD++++

CMD ./q2proded +set net_port 27910 +set game "$GAME" +map "$INITMAP" +exec config.cfg
