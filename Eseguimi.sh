#!/bin/bash

read -p "Vuoi scaricare anche il video? (S/N): " answer
echo "--------------------------"

# Normalizzo la risposta a maiuscolo
answer="${answer^^}"

if [[ "$answer" == "S" ]]; then
    command='yt-dlp -verbose -f bestvideo+bestaudio/best --cookies cookies.txt --embed-metadata --embed-thumbnail -o "./%(title)s.%(ext)s"'

    echo "--------------------------"
    echo "Sia il video che l'audio verranno scaricati"
    echo "--------------------------"

elif [[ "$answer" == "N" ]]; then
    command='yt-dlp -f bestaudio --extract-audio --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ffmpeg: -c:v mjpeg -vf crop='\''if(gt(ih\,iw)\,iw\,ih):if(gt(iw\,ih)\,ih\,iw)'\''" -o "./%(title)s.%(ext)s"'

    echo "Solo l'audio verra' scaricato."
    echo "--------------------------"

    read -p "Vuoi uno specifico formato audio? (ES: flac, m4a, opus. Lascia vuoto per il formato originale): " format
    echo "--------------------------"

    if [[ -n "$format" ]]; then
        command="$command --audio-format $format"
    fi

else
    echo "--------------------------"
    echo "Rispondi Si' oppure no."
    echo "--------------------------"
    exit 1
fi

read -p "Inserisci il collegamento al video YouTube: " videolink
echo "--------------------------"

# Aggiungo il link al comando
command="$command \"$videolink\""

# Lancio yt-dlp
eval $command

echo "--------------------------"
read -p "Premi Invio per uscire"

exit 0
