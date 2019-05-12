#!/bin/sh

wait_wlan0 ()
{
	n=0
	ifconfig wlan0
	waitagain=$?
	while [ $waitagain -ne 0 ] && [ $n -ne 30 ]; do
		n=$(($n + 1))
		sleep 0.1
		ifconfig wlan0
		waitagain=$?
	done
}

wifi_rmmod ()
{
	if [ -e /sys/module/bcmdhd ]; then
		# Note: Need wl to set interface "real down".
		wl down
		ifconfig wlan0 down
	fi
	
	rmmod bcmdhd
	
	echo 1 0 > /proc/ambarella/mmc_fixed_cd
	
	/usr/local/share/script/t_gpio.sh 24 0

	n=0
	while [ "`ls /sys/bus/sdio/devices`" != "" ] && [ $n -ne 30 ]; do
		n=$(($n + 1))
		sleep 0.1
	done
}

wifi_insmod ()
{
	if [ -z "`ls /sys/bus/sdio/devices`" ]; then
		/usr/local/share/script/t_gpio.sh 24 0
		/usr/local/share/script/t_gpio.sh 24 1
		echo 1 1 > /proc/ambarella/mmc_fixed_cd
	fi

	n=0
	while [ -z "`ls /sys/bus/sdio/devices`" ] && [ $n -ne 30 ]; do
		n=$(($n + 1))
		sleep 0.1
	done

	insmod /lib/modules/bcmdhd.ko firmware_path=/usr/local/bcmdhd/fw_apsta.bin nvram_path=/usr/local/bcmdhd/nvram.txt iface_name=wlan dhd_msg_level=0x00 op_mode=1
	waitagain=1
	if [ "`ls /sys/bus/sdio/devices`" != "" ] || [ "`ls /sys/bus/usb/devices 2>/dev/null`" != "" ]; then
		wait_wlan0
	fi
	if [ $waitagain -ne 0 ]; then
		echo "There is no WIFI interface!"
		wifi_rmmod
		exit 1
	fi
	echo "found WIFI interface!"
	ifconfig wlan0 up
}

wifi_channel_scan ()
{
	SCAN_CHANNEL=`iwlist wlan0 scan | grep Frequency`
	channel1_num=`echo $SCAN_CHANNEL | grep -o 'Channel 1' | wc -l`
	channel6_num=`echo $SCAN_CHANNEL | grep -o 'Channel 6' | wc -l`
	channel11_num=`echo $SCAN_CHANNEL | grep -o 'Channel 11' | wc -l`
	echo "channel1_num=${channel1_num}"
	echo "channel6_num=${channel6_num}"
	echo "channel11_num=${channel11_num}"

	channel_num_min=$channel6_num
	export OPTIMAL_CHANNEL=6
	if [ $channel11_num -lt $channel_num_min ];then
		channel_num_min=$channel11_num
		export OPTIMAL_CHANNEL=11
	fi
}

wifi_insmod
wifi_channel_scan
wifi_rmmod
/usr/local/share/script/wifi_start.sh
