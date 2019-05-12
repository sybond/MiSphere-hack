#!/bin/sh

sed -i -e 's|AP_SSID\(.*\)|AP_SSID='$1'|g' -e 's|AP_PUBLIC\(.*\)|AP_PUBLIC=no|g' -e 's|AP_PASSWD\(.*\)|AP_PASSWD='$2'|g' /tmp/FL0/pref/wifi.conf
