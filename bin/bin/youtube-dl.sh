#!/data/data/com.termux/files/usr/bin/bash
# Copyright 2017 Gabi Tiplea

echo "Copyright 2017 Gabi Tiplea"
echo "For audio only press 1"
echo "For video 360p press 2"
echo "For video 480p press 3"
echo "For video 720p press 4"
echo "For video 1080p press 5"

command='-no-mtime -o /data/data/com.termux/files/home/storage/shared/Youtube/%(title)s.%(ext)s -f'
read option

if [ "$option" -eq "1" ]
then
    echo "$command 140" > ~/.config/youtube-dl/config
    youtube-dl $1

elif [ "$option" -eq "2" ]
then
    echo "$command \"best[height<=360]\"" > ~/.config/youtube-dl/config
    youtube-dl $1

elif [ "$option" -eq "3" ]
then
    echo "$command \"best[height<=480]\"" > ~/.config/youtube-dl/config
    youtube-dl $1

elif [ "$option" -eq "4" ]
then
    echo "$command \"best[height<=720]\"" > ~/.config/youtube-dl/config
    youtube-dl $1

elif [ "$option" -eq "5" ]
then
    echo "$command \"best[height<=1080]\"" > ~/.config/youtube-dl/config
    youtube-dl $1
fi

