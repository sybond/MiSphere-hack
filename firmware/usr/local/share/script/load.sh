#!/bin/sh

if [ ! -e /tmp/wifi.preloaded ]; then
	/usr/local/share/script/preload.sh
fi
rm -f /tmp/wifi.preloaded

KO=bcmdhd.ko
# BCM will get name by configure.
BCM=bcmdhd
P_FW="firmware_path=/usr/local/${BCM}/fw"
P_NVRAM="nvram_path=/usr/local/${BCM}/nvram.txt"
P_IF="iface_name=wlan"
P_DBG="dhd_msg_level=0x00"

load_mod()
{
#	mac=`cat /tmp/wifi0_mac`
#	if [ "${mac}" != "00:00:00:00:00:00" ] &&  [ "${mac}" != "" ]; then
#		insmod /lib/modules/${KO} ${P_FW}_apsta.bin ${P_NVRAM} ${P_IF} ${P_DBG} $1 amba_initmac=${mac}
#	else
		insmod /lib/modules/${KO} ${P_FW}_apsta.bin ${P_NVRAM} ${P_IF} ${P_DBG} $1
#	fi
}

case $1 in
	sta)
		load_mod op_mode=1
	;;
	p2p)
		load_mod op_mode=1
	;;
	*)
		# Set as AP
		load_mod op_mode=2
	;;
esac

# Needed for App.
touch /tmp/wifi.loaded

# Disable WiFi CPU offloading
if [ -e /sys/module/bcmdhd/parameters/tx_coll_max_time ] && [ -e /proc/ambarella/clock ]; then
	gclk_cortex=`cat /proc/ambarella/clock | grep gclk_cortex|awk '{print $2}'`
	if [ "${gclk_cortex}" != "" ] && [ ${gclk_cortex} -gt 504000000 ]; then
		echo 0 > /sys/module/bcmdhd/parameters/tx_coll_max_time
	fi
fi

#fix A9S bcm43340 SDIO command 53 timeout issue
if [ `grep gclk_sdio /proc/ambarella/clock|awk '{print $2}'` -ge 44000000 ] && \
	[ "`zcat /proc/config.gz | grep CONFIG_PLAT_AMBARELLA_S2E=y`" != "" ] && \
	[ -e /sys/module/bcmdhd/parameters/info_string ] && \
	[ "`grep 1.88.45.11 /sys/module/bcmdhd/parameters/info_string`" != "" ] && \
	[ "`grep a94c /sys/module/bcmdhd/parameters/info_string`" != "" ]; then
		echo 43636363 > /sys/kernel/debug/mmc0/clock
fi
