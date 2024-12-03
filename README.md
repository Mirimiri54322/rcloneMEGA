# rcloneMEGA
Just a simple bash script and instructions for Linux to automatically mount something with `rclone` on login, or whenever you want if you would prefer to do this manually. I originally made this for my MEGA cloud storage, and then realized it applies to more than just that. Someone has probably already made a script that does the same thing better, but there's nothing wrong with a little redundancy.

---

1. If you haven't already, follow this tutorial (or something similar) to set up `rclone` to mount MEGA: https://rclone.org/mega/
2. Paste the command you will use to mount MEGA into the script. Your command will look something like `rclone mount remote: /Path/To/Mount/Location --daemon`.
3. Change the variable `LOGPATH` to wherever you want your log file to go. If you don't want a log file, change it to `/dev/null`.
4. To run this manually, go to the location of `rcloneMEGA.sh` and set its permissions to make it executable. You can do that with `chmod +x rcloneMEGA.sh`.
5. To make this run each time you log in, run the command `crontab -e` then add `@reboot /path/to/rcloneMEGA.sh` to the end of the file. To stop this from running every time, you can do `crontab -e` again and remove that line.
