#!/bin/bash

ffmpeg -i rtmp://lpmedia.hu:1935/Hatoscsatorna/livestream -c:v libx264 -preset slow -crf 23 -c:a aac -b:a 192k -f mpegts srt://<IPSERVER_CHANGE_THIS>:8181
