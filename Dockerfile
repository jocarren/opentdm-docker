FROM ubuntu:latest
MAINTAINER Jonathan Carreño <jocarren@gmail.com>
ENV NET_PORT 27910
add . /opt/quake2
run useradd -m -s /bin/bash quake2
run chown -R quake2:quake2 /opt/quake2
run apt-get update
run apt-get install wget -y
run wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/quake2
expose ${NET_PORT}:27910/udp
workdir /opt/quake2
user quake2
#GENERAL
run echo "set hostname ${HOSTNAME}" > ${GAME}/server.cfg
run echo "set maxclients ${MAXCLIENTS}" >> ${GAME}/server.cfg
run echo "set public ${PUBLIC}" >> ${GAME}/server.cfg
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

run echo "set g_motd_message ${G_MOTD_MESSAGE}" >> ${GAME}/server.cfg
run echo "set g_vote_time ${G_VOTE_TIME}" >> ${GAME}/server.cfg
run echo "set g_chat_mode ${G_CHAT_MODE}" >> ${GAME}/server.cfg


#run /bin/bash
CMD ./q2proded +set net_port 27910 +set game OPENTDM +exec server.cfg


