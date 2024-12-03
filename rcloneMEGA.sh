# Miriam Logan | 2024
# This program pings MEGA until it gets something back, then mounts it with rclone.
# The point is to run this at startup to automatically mount it when and only when the system is actually ready to do so.
# GitHub repo with more instructions at https://github.com/Mirimiri54322/rcloneMEGA.

LOGPATH='~/Documents/rcloneMEGA.log' # Change this to the path where you want the log to go, or to /dev/null for no log.
touch "$LOGPATH"

printf "Beginning...\n" | ts '[%Y-%m-%d %H:%M:%S]' >> "$LOGPATH"

until curl -I "https://mega.io"; do # If you're not using MEGA, you may want to change that URL to something else.
	printf "Couldn't connect. Waiting 10 seconds...\n" | ts '[%Y-%m-%d %H:%M:%S]' >> "$LOGPATH"
	sleep 10
done
	printf "Mounting MEGA...\n" | ts '[%Y-%m-%d %H:%M:%S]' >> "$LOGPATH"
	rclone mount remote: ~/Remote/ --daemon # Change this line to whatever command you use to mount with rclone.
	printf "Mounted.\n" | ts '[%Y-%m-%d %H:%M:%S]' >> "$LOGPATH"
	printf "\n" >> "$LOGPATH"
	notify-send 'Succesfully mounted with rclone.'
