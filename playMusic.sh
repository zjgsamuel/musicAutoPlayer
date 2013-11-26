#!/bin/bash

MUSIC_PATH="/home/linaro/Music/Songs"
PLAY_LIST="music.lst"
MUSIC_TYPES="mp3 wav ape ogg flac";

if [ -f "${MUSIC_PATH}/${PLAY_LIST}" ] ; then
   sudo rm ${MUSIC_PATH}/${PLAY_LIST}
fi

sudo /usr/local/bin/deleteSpace.sh

if [ ! -e "${MUSIC_PATH}/${PLAY_LIST}" ] || ( [ $# -gt 0 ] && [ $1 == "rescan" ] ); then 
    echo "" >  ${MUSIC_PATH}/${PLAY_LIST}
    for music_type in $MUSIC_TYPES ; do
        find ${MUSIC_PATH} -type f -iname "*.${music_type}" >> ${MUSIC_PATH}/${PLAY_LIST}
    done
fi

mplayer -vo null -shuffle -loop 0  -playlist  ${MUSIC_PATH}/${PLAY_LIST} 