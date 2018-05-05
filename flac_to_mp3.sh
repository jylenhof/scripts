#!/bin/sh
# Avec Gestion des espaces et des sous-dossiers ;-)
set -x
find . -name \*.flac|while read -r myfile
do
myfile_basename=`basename "$myfile" .flac`
myfile_dirname=`dirname "$myfile"` 
ffmpeg -y -i "$myfile" -ab 320KB -map_metadata 0 -id3v2_version 3 "$myfile_dirname/$myfile_basename.mp3" < /dev/null
done 
