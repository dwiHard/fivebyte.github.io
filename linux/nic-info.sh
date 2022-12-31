#!/bin/sh
hostname
echo "-------------"
for iname in $(ip a |awk '/state UP/{print $2}')
do
echo "$iname"
ip a | grep -A2 $iname | awk '/inet/{print $2}'
ip a | grep -A2 $iname | awk '/link/{print $2}'
ethtool $iname |grep "Speed:"
done