#!/bin/bash
 
echo "Configuring screen parameters..."
 
#- Start an X Virtual Frame Buffer on screen 1, send any output to /dev/null
Xvfb :18 -screen 18 1024x768x24 2>&1 >/dev/null &
 
#- Get Xvfb PID, so we can kill it later
XVFB=$!
 
#- Export our display for this particular session to what we defined in the above command
export DISPLAY=:18
 
#- Give a couple seconds for things to warm up
sleep 2
 
#############################
#- Start Code
#############################
echo "Starting Selenium Server..."
 
#- Selenium opens up Firefox, and uses the browser to automate web tasks...
#xterm -hold -e "java -jar ../software/selenium-server/selenium-server-2.4.0.jar -firefoxProfileTemplate '../software/selenium-server/firefox-profile/'" &
 
#- Get Selnium server PID, so we can kill it later
#SELENIUM=$!
 
#- Allow our selenium server to startup, give it some time
sleep 10
 
#- Run our selenium scripts for each site/page we want to automate
#perl start.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"` 
#perl site1.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"`
#perl site2.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"`
#perl site3.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"`
#perl site4.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"`
#perl cleanup.pl 2>&1 | tee -a logs/log_`date +"%m-%d-%Y"`
 
echo "Shutting down Selenium/Xvfb Server in 5 Seconds..."
sleep 5
#kill -9 $SELENIUM
#############################
#End code
#############################
 
kill -9 $XVFB
