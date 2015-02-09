#!/bin/bash
# My first script

echo "Start the Emulator"
/home/murali/android-sdk-linux/tools/emulator @$AVD_NAME &

echo "Delay for emulator startup"
sleep 5m

echo "Start the unlock of emulator screen"
adb devices
sleep 10s
adb shell input keyevent KEYCODE_POWER; adb shell input keyevent KEYCODE_MENU

echo "Wait after unlock the screen"
sleep 15s

echo "Wait after using delete command"
adb shell input keyevent KEYCODE_ENTER
sleep 4s
adb shell input keyevent KEYCODE_ENTER
sleep 4s
adb shell input keyevent KEYCODE_BACK

echo "Wait after using enter command"
sleep 10s

echo "Emulator is started now, log to calatest folder"
cd ~/calatest

echo "Now, exeucte the calabash"
/usr/local/bin/calabash-android run features/apk_files/com.july.cricinfo.apk --tag @ecricinfo_video

echo "Execution is successfully completed"

kill $(ps aux | grep '[e]mulator' | awk '{print $2}')
#pkill emulator
echo "Emulator is closed"
