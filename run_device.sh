#!/bin/bash
killall 'Simulator'
echo $DEVICE_TARGET
xcrun instruments -w $DEVICE_TARGET
export DEVICE_TARGET=$DEVICE_TARGET

count=`xcrun simctl list | grep Booted | wc -l | sed -e 's/ //g'`
while [ $count -lt 1 ]
do
    sleep 1
    count=`xcrun simctl list | grep Booted | wc -l | sed -e 's/ //g'`
done

xcrun simctl install booted $PWD/build/Build/Products/Debug-iphonesimulator/Reader.app
sleep 5
