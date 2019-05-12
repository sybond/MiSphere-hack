#!/bin/sh

cp /usr/local/share/script/wifi.conf /pref/wifi.conf
sed -i -e 's|AP_SSID\(.*\)|AP_SSID='$1'|g' /tmp/FL0/pref/wifi.conf
/usr/local/share/script/wifi_reset_stop.sh
/usr/local/share/script/wifi_start.sh
