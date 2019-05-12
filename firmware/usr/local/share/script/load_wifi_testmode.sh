#!/bin/sh

KO=bcmdhd.ko
# BCM will get name by configure.
BCM=bcmdhd
P_FW="firmware_path=/usr/local/share/script/fw"
P_NVRAM="nvram_path=/usr/local/${BCM}/nvram.txt"
P_IF="iface_name=wlan0"

load_mod()
{
	insmod /lib/modules/${KO} $(P_IF) ${P_FW}_bcm43438a1_mfg.7.10.323.50.bin ${P_NVRAM}
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

