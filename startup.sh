#!/bin/sh

chmod 777 -R /server
chmod +x /server/$startfile

#sh /server/$startfile
#$startfile

echo "[info] Starting Minecraft Java process..."
screen -L -Logfile '/server/screen.log' -d -S  minecraft -m sh -c "cd /server && trap 'exit 0' SIGINT SIGTERM; while true; do ./$startfile; done"
echo "[info] Minecraft Java process is running"
export TERM=screen

/usr/local/bin/gotty --port=8222 --title-format "MC" --credential $username:$password --permit-write screen -x minecraft
