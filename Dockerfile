FROM ubuntu:latest
MAINTAINER Jonathan Carreño <jocarren@gmail.com>
ENV NET_PORT 27910
ENV GAME opentdm
add . /opt/quake2
run useradd -m -s /bin/bash quake2
run chown -R quake2:quake2 /opt/quake2
run apt-get update
run apt-get install wget -y
run wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/quake2
expose ${NET_PORT}:27910/udp
workdir /opt/quake2
user quake2

#++++ENVIRONMENT VARIABLES FOR SERVER.CFG++++

#GENERAL
run echo "set hostname ${HOSTNAME}" > ${GAME}/server.cfg
run echo "set maxclients ${MAXCLIENTS}" >> ${GAME}/server.cfg
run echo "set deathmatch ${DEATHMATCH}" >> ${GAME}/server.cfg
run echo "set cheats ${CHEATS}" >> ${GAME}/server.cfg

#RCON
run echo "set rcon_password ${RCON_PASSWORD}" >> ${GAME}/server.cfg
run echo "set g_admin_password ${G_ADMIN_PASSWORD}" >> ${GAME}/server.cfg

#ANTICHEAT
run echo "set anticheat ${ANTICHEAT}" >> ${GAME}/server.cfg
run echo "set sv_anticheat_required ${SV_ANTICHEAT_REQUIRED}" >> ${GAME}/server.cfg 

#LOGS
run echo "set log_stats ${LOG_STATS}" >> ${GAME}/server.cfg
run echo "set logfile_name ${LOGFILE_NAME}" >> ${GAME}/server.cfg
run echo "set logfile ${LOGFILE}" >> ${GAME}/server.cfg
run echo "set logfile_timestamp ${LOGFILE_TIMESTAMP}" >> ${GAME}/server.cfg

#GAME OPENTDM
run echo "set g_gamemode ${G_GAMEMODE}" >> ${GAME}/server.cfg
run echo "set g_match_time ${G_match_time}" >> ${GAME}/server.cfg
run echo "set g_fast_weap_switch ${G_FAST_WEAP_SWITCH}" >> ${GAME}/server.cfg
run echo "set g_overtime ${G_OVERTIME}" >> ${GAME}/server.cfg
run echo "set g_tie_mode ${G_TIE_MODE}" >> ${GAME}/server.cfg
run echo "set g_teleporter_nofreeze ${G_TELEPORTER_NOFREEZE}" >> ${GAME}/server.cfg
run echo "set g_tie_mode ${G_TIE_MODE}" >> ${GAME}/server.cfg

#FLAGS OPENTDM
run echo "set g_tdmflags ${G_TDMFLAGS}" >> ${GAME}/server.cfg
run echo "set g_itdmflags ${G_ITDMFLAGS}" >> ${GAME}/server.cfg
run echo "set g_1v1flags ${G_1V1FLAGS}" >> ${GAME}/server.cfg
run echo "set g_itemflags ${G_ITEMFLAGS}" >> ${GAME}/server.cfg
run echo "set g_powerupflags ${G_POWERUPFLAGS}" >> ${GAME}/server.cfg

#TEAM OPENTDM

run echo "set g_team_a_skin ${G_TEAM_A_SKIN}" >> ${GAME}/server.cfg
run echo "set g_team_b_skin ${G_TEAM_B_SKIN}" >> ${GAME}/server.cfg
run echo "set g_locked_skins ${G_LOCKED_SKINS}" >> ${GAME}/server.cfg
run echo "set g_team_a_name ${G_TEAM_A_NAME}" >> ${GAME}/server.cfg
run echo "set g_team_b_name ${G_TEAM_B_NAME}" >> ${GAME}/server.cfg
run echo "set g_locked_names ${G_LOCKED_NAMES}" >> ${GAME}/server.cfg

#MISC
run echo "set g_intermission_time ${G_INTERMISSION_TIME}" >> ${GAME}/server.cfg
run echo "set g_tdm_allow_pick ${G_TDM_ALLOW_PICK}" >> ${GAME}/server.cfg
run echo "set g_allow_vote_config ${G_ALLOW_VOTE_CONFIG}" >> ${GAME}/server.cfg
run echo "set g_motd_message ${G_MOTD_MESSAGE}" >> ${GAME}/server.cfg
run echo "set g_vote_time ${G_VOTE_TIME}" >> ${GAME}/server.cfg
run echo "set g_chat_mode ${G_CHAT_MODE}" >> ${GAME}/server.cfg
run echo "set g_max_timeout ${G_MAX_TIMEOUT}" >> ${GAME}/server.cfg
run echo "set g_1v1_timeout ${G_1V1_TIMEOUT}" >> ${GAME}/server.cfg
run echo "set g_respawn_time ${G_RESPAWN_TIME}" >> ${GAME}/server.cfg
run echo "set g_idle_time ${G_IDLE_TIME}" >> ${GAME}/server.cfg
run echo "set g_max_force_screenshot ${G_FORCE_SCREENSHOT}" >> ${GAME}/server.cfg
run echo "set g_max_force_record ${G_FORCE_RECORD}" >> ${GAME}/server.cfg
run echo "set g_bugs ${G_BUGS}" >> ${GAME}/server.cfg
run echo "set g_allow_name_change_during_match ${G_ALLOW_NAME_CHANGE_DURING_MATCH}" >> ${GAME}/server.cfg
run echo "set g_maplistfile ${G_MAPLISTFILE}" >> ${GAME}/server.cfg
run echo "set g_auto_rejoin_match ${G_AUTO_REJOIN_MATCH}" >> ${GAME}/server.cfg
run echo "set g_max_players_per_team ${G_MAX_PLAYERS_PER_TEAM}" >> ${GAME}/server.cfg
run echo "set g_admin_vote_decide ${G_ADMIN_VOTE_DECIDE}" >> ${GAME}/server.cfg
run echo "set g_1v1_spawn_mode ${G_1V1_SPAWN_MODE}" >> ${GAME}/server.cfg
run echo "set g_tdm_spawn_mode ${G_TDM_SPAWN_MODE}" >> ${GAME}/server.cfg
run echo "set g_vote_mask ${G_VOTE_MASK}" >> ${GAME}/server.cfg

#TAUNT FLOOD

run echo "set flood_waves ${FLOOD_WAVES}" >> ${GAME}/server.cfg
run echo "set flood_waves_perminute ${FLOOD_WAVES_PERMINUTE}" >> ${GAME}/server.cfg
run echo "set flood_waves_waitdelay ${FLOOD_WAVES_WAITDELAY}" >> ${GAME}/server.cfg

#HTTP

run echo "set g_http_enabled ${G_HTTP_ENABLED}" >> ${GAME}/server.cfg
run echo "set g_http_base_url ${G_HTTP_BASE_URL" >> ${GAME}/server.cfg

#DEDICATED

run echo "set public ${PUBLIC}" >> ${GAME}/server.cfg
run echo "setmaster ${SETMASTER}" >> ${GAME}/server.cfg

#DOWNLOAD

run echo "set allow_download ${ALLOW_DOWNLOAD}" >> ${GAME}/server.cfg
run echo "set allow_download_maps ${ALLOW_DOWNLOAD_MAPS}" >> ${GAME}/server.cfg
run echo "set allow_download_sounds ${ALLOW_DOWNLOAD_SOUNDS}" >> ${GAME}/server.cfg
run echo "set allow_download_models ${ALLOW_DOWNLOAD_MODELS}" >> ${GAME}/server.cfg
run echo "set allow_download_players ${ALLOW_DOWNLOAD_PLAYERS}" >> ${GAME}/server.cfg

#MVD

run echo "set sv_mvd_enable ${SV_MVD_ENABLE}" >> ${GAME}/server.cfg
run echo "set addgtvhost ${ADDGTVHOST}" >> ${GAME}/server.cfg

#MAP
run echo "set map ${INITMAP}" >> ${GAME}/server.cfg #initial map, default q2dm1.

#++++ENVIRONMENT VARIABLES FOR SERVER.CFG++++

CMD ./q2proded +set net_port 27910 +set game ${GAME} +exec server.cfg


