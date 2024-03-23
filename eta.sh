#configure.sh VNC_USER_PASSWORD VNC_PASSWORD NGROK_AUTH_TOKEN

#disable spotlight indexing
sudo mdutil -i off -a

#Create new account
sudo dscl . -create /Users/vncuser
sudo dscl . -create /Users/vncuser UserShell /bin/bash
sudo dscl . -create /Users/vncuser RealName "VNC User"
sudo dscl . -create /Users/vncuser UniqueID 1001
sudo dscl . -create /Users/vncuser PrimaryGroupID 80
sudo dscl . -create /Users/vncuser NFSHomeDirectory /Users/vncuser
sudo dscl . -passwd /Users/vncuser $1
sudo dscl . -passwd /Users/vncuser $1
sudo createhomedir -c -u vncuser > /dev/null

#Enable VNC

#VNC password - http://hints.macworld.com/article.php?story=20071103011608872

#Start VNC/reset changes

#install ngrok
brew install --cask ngrok

#configure ngrok and start it
ngrok authtoken $3
ngrok tcp 5900 &

osascript -e 'do shell script "open x-apple.systempreferences:com.apple.Sharing-Settings.extension"
delay 5

tell application "System Events"
	click checkbox "Screen Sharing" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Sharing" of application process "System Settings"
end tell

delay 5

tell application "System Events"
	click checkbox "Screen Sharing" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Sharing" of application process "System Settings"
end tell


'
