#!/bin/bash

MUSIC_PATH="/home/linaro/Music/Rings"
PLAY_LIST="music.lst"
MUSIC_TYPES="mp3 wav ape ogg flac";

if [ -f "${MUSIC_PATH}/${PLAY_LIST}" ] ; then
   sudo rm ${MUSIC_PATH}/${PLAY_LIST}
fi

find ${MUSIC_PATH} -type f -name "*.mp3" -print |
while read name;
do
   na=$(echo $name | tr -d ' ')
   if [[ $name != $na ]]; then
      mv "$name" $na;
   fi
done

if [ ! -e "${MUSIC_PATH}/${PLAY_LIST}" ] || ( [ $# -gt 0 ] && [ $1 == "rescan" ] ); then 
    echo "" >  ${MUSIC_PATH}/${PLAY_LIST}
    for music_type in $MUSIC_TYPES ; do
        find ${MUSIC_PATH} -type f -name "*.${music_type}" >> ${MUSIC_PATH}/${PLAY_LIST}
    done
fi

mplayer -vo null -playlist  ${MUSIC_PATH}/${PLAY_LIST} 