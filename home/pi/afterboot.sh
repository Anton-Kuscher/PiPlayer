{
screen -dmS htop;screen -S htop -X stuff $'htop\n';screen -dmS current_playing_screen;screen -S current_playing_screen -X stuff $'python /home/pi/webinterface/getcurrent.py\n';sudo /usr/local/bin/noip2;sudo service mpd start;mpc update;}&>/dev/null;
echo "$(tput setaf 2)$(tput bold)[  DONE  ]$(tput sgr0) executing startup programs";
