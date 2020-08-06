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

RUN echo set hostname "$HOSTNAME" >> config.cfg \
RUN echo set maxclients "$MAXCLIENTS" >> config.cfg \
RUN echo set deathmatch "$DEATHMATCH" >> config.cfg \
RUN echo set cheats "$CHEATS" >> config.cfg \
RUN echo set rcon_password "$RCON_PASSWORD" >> config.cfg \
RUN echo set g_admin_password "$G_ADMIN_PASSWORD" >> config.cfg \
RUN echo set anticheat "$ANTICHEAT" >> config.cfg \
RUN echo set sv_anticheat_required "$SV_ANTICHEAT_REQUIRED" >> config.cfg \ 
RUN echo set log_stats "$LOG_STATS" >> config.cfg \
RUN echo set logfile_name "$LOGFILE_NAME" >> config.cfg \
RUN echo set logfile "$LOGFILE" >> config.cfg \
RUN echo set logfile_timestamp "$LOGFILE_TIMESTAMP" >> config.cfg \
RUN echo set g_gamemode "$G_GAMEMODE" >> config.cfg \
RUN echo set g_match_time "$G_MATCH_TIME" >> config.cfg \
RUN echo set g_match_countdown "$G_MATCH_COUNTDOWN" >> config.cfg \
RUN echo set g_fast_weap_switch "$G_FAST_WEAP_SWITCH" >> config.cfg \
RUN echo set g_overtime "$G_OVERTIME" >> config.cfg \
RUN echo set g_tie_mode "$G_TIE_MODE" >> config.cfg \
RUN echo set g_teleporter_nofreeze "$G_TELEPORTER_NOFREEZE" >> config.cfg \
RUN echo set g_tdmflags "$G_TDMFLAGS" >> config.cfg \
RUN echo set g_itdmflags "$G_ITDMFLAGS" >> config.cfg \
RUN echo set g_1v1flags "$G_1V1FLAGS" >> config.cfg \
RUN echo set g_itemflags "$G_ITEMFLAGS" >> config.cfg \
RUN echo set g_powerupflags "$G_POWERUPFLAGS" >> config.cfg \
RUN echo set g_team_a_skin "$G_TEAM_A_SKIN" >> config.cfg \
RUN echo set g_team_b_skin "$G_TEAM_B_SKIN" >> config.cfg \
RUN echo set g_locked_skins "$G_LOCKED_SKINS" >> config.cfg \
RUN echo set g_team_a_name "$G_TEAM_A_NAME" >> config.cfg \
RUN echo set g_team_b_name "$G_TEAM_B_NAME" >> config.cfg \
RUN echo set g_locked_names "$G_LOCKED_NAMES" >> config.cfg \
RUN echo set g_intermission_time "$G_INTERMISSION_TIME" >> config.cfg \
RUN echo set g_tdm_allow_pick "$G_TDM_ALLOW_PICK" >> config.cfg \
RUN echo set g_allow_vote_config "$G_ALLOW_VOTE_CONFIG" >> config.cfg \
RUN echo set g_motd_message "$G_MOTD_MESSAGE" >> config.cfg \
RUN echo set g_vote_time "$G_VOTE_TIME" >> config.cfg \
RUN echo set g_chat_mode "$G_CHAT_MODE" >> config.cfg \
RUN echo set g_max_timeout "$G_MAX_TIMEOUT" >> config.cfg \
RUN echo set g_1v1_timeout "$G_1V1_TIMEOUT" >> config.cfg \
RUN echo set g_respawn_time "$G_RESPAWN_TIME" >> config.cfg \
RUN echo set g_idle_time "$G_IDLE_TIME" >> config.cfg \
RUN echo set g_force_screenshot "$G_FORCE_SCREENSHOT" >> config.cfg \
RUN echo set g_force_record "$G_FORCE_RECORD" >> config.cfg \
RUN echo set g_bugs "$G_BUGS" >> config.cfg \
RUN echo set g_allow_name_change_during_match "$G_ALLOW_NAME_CHANGE_DURING_MATCH" >> config.cfg \
RUN echo set g_maplistfile "$G_MAPLISTFILE" >> config.cfg \
RUN echo set g_auto_rejoin_match "$G_AUTO_REJOIN_MATCH" >> config.cfg \
RUN echo set g_auto_rejoin_map "$G_AUTO_REJOIN_MAP" >> config.cfg \
RUN echo set g_max_players_per_team "$G_MAX_PLAYERS_PER_TEAM" >> config.cfg \
RUN echo set g_admin_vote_decide "$G_ADMIN_VOTE_DECIDE" >> config.cfg \
RUN echo set g_1v1_spawn_mode "$G_1V1_SPAWN_MODE" >> config.cfg \
RUN echo set g_tdm_spawn_mode "$G_TDM_SPAWN_MODE" >> config.cfg \
RUN echo set g_vote_mask "$G_VOTE_MASK" >> config.cfg \
RUN echo set flood_waves "$FLOOD_WAVES" >> config.cfg \
RUN echo set flood_waves_perminute "$FLOOD_WAVES_PERMINUTE" >> config.cfg \
RUN echo set flood_waves_waitdelay "$FLOOD_WAVES_WAITDELAY" >> config.cfg \
RUN echo set g_http_enabled "$G_HTTP_ENABLED" >> config.cfg \
RUN echo set g_http_base_url "$G_HTTP_BASE_URL" >> config.cfg \
RUN echo set public "$PUBLIC" >> config.cfg \
RUN echo setmaster "$SETMASTER" >> config.cfg \
RUN echo set allow_download "$ALLOW_DOWNLOAD" >> config.cfg \
RUN echo set allow_download_maps "$ALLOW_DOWNLOAD_MAPS" >> config.cfg \
RUN echo set allow_download_sounds "$ALLOW_DOWNLOAD_SOUNDS" >> config.cfg \
RUN echo set allow_download_models "$ALLOW_DOWNLOAD_MODELS" >> config.cfg \
RUN echo set allow_download_players "$ALLOW_DOWNLOAD_PLAYERS" >> config.cfg \
RUN echo set sv_mvd_enable "$SV_MVD_ENABLE" >> config.cfg \
RUN echo set addgtvhost "$ADDGTVHOST" >> config.cfg \
RUN echo set sv_iplimit "$SV_IPLIMIT" >> config.cfg \

#++++END DIRECORY AND EXECUTABLE BUILD++++

CMD ./q2proded RUN echo set net_port 27910 RUN echo set game "$GAME" +map "$INITMAP"
