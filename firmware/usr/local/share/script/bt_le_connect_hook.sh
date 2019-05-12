#!/bin/sh
sysl=`ps | grep syslogd | grep -v grep`
LOGGER ()
{
	if [ "${sysl}" == "" ]; then
		echo "$@"
	else
		logger "$@"
	fi
}

sleep 0.5
LOGGER "$@"

padding()
{
	for i in `seq ${pad_len}`; do
		echo -n "00 "
	done
}

#for customer to hook their setting
HCI_LE_Set_Advertising_Parameters ()
{
	#HCI Command: LE Set Advertise Disable
	hcitool cmd 0x08 0x000A 00

	#HCI Command: LE Set Advertising Parameters

	if [ "${2}" == "new" ]; then	
		#20 ms
		Advertising_Interval_Min="20 00"
		Advertising_Interval_Max="21 00"
	elif [ "${2}" == "recon" ]; then
		#20 ms
		Advertising_Interval_Min="20 00"
		Advertising_Interval_Max="21 00"
	else
		#500 ms
		Advertising_Interval_Min="20 03"
		Advertising_Interval_Max="21 03"
	fi
	Advertising_Type_Connectable="00"
	Own_Address_Type_public=00
	Direct_Address_Type_public=00
	Direct_Address="00 00 00 00 00 00"
	Advertising_Channel_Map_all=07
	Advertising_Filter_Policy_nowhite=00
	hcitool cmd 0x08 0x0006 $Advertising_Interval_Min $Advertising_Interval_Max \
	$Advertising_Type_Connectable $Own_Address_Type_public $Direct_Address_Type_public $Direct_Address \
	$Advertising_Channel_Map_all $Advertising_Filter_Policy_nowhite

	#HCI Command: LE Set Advertise Enable
	hcitool cmd 0x08 0x000A 01

	#NOTE: Android need flag 0x1e to skip pairing
	#HCI Command: LE Set Advertising Data
	DEVICE_NAME=`cat /pref/bt.conf |grep DEVICE_NAME|cut -c 13-`
	DEVICE_NAME_LEN=`echo $DEVICE_NAME|wc -c`
	if [ "${2}" == "old" ]; then
		MADV_FLAG=`cat /pref/bt.conf |grep MADV_FLAG_OLD|cut -c 15-`
	elif [ "${2}" == "new" ]; then
		MADV_FLAG=`cat /pref/bt.conf |grep MADV_FLAG_NEW|cut -c 15-`
	elif [ "${DEVICE_NAME}" == "AB_RC_PT" ]; then
		MADV_FLAG=`cat /pref/bt.conf |grep MADV_FLAG_NEW|cut -c 15-`
	else
		MADV_FLAG=`cat /pref/bt.conf |grep MADV_FLAG_OLD|cut -c 15-`
	fi
	MADV_FLAG_LEN=`echo $MADV_FLAG|wc -c`
	madv_len=`printf %02x $MADV_FLAG_LEN`
	madv_type="ff"
	madv=`echo -n $MADV_FLAG|hexdump -C|grep 00000000|sed 's/00000000//'|cut -d '|' -f 1`
	cmd_len="1e"
	flag_len="02"
	flag_type="01"
	flag="1e"
	#power_len="02"
	#power_type="0a"
	#power="04"
	name_len=`printf %02x $DEVICE_NAME_LEN`
	name_type="09"
	name=`echo -n $DEVICE_NAME|hexdump -C|grep 00000000|sed 's/00000000//'|cut -d '|' -f 1`
	pad_len=$((30 - ${DEVICE_NAME_LEN} - 6))
	hcitool cmd 0x08 0x0008 $cmd_len $flag_len $flag_type $flag \
	$name_len $name_type $name \
	$madv_len $madv_type $madv \
	`padding`
}

#fix bluez5 hci_le_set_advertise_enable segmentation fault
if [ "${1}" == "leadv5" ]; then
	HCI_LE_Set_Advertising_Parameters ${1} ${2}
fi

##GATT connected: reduce power consumption by disable piscan
#if [ "${1}" == "connected" ]; then
#	hciconfig hci0 noscan
#fi
#
##GATT disconnected: restore piscan status, restart advertising
#if [ "${1}" == "leadv" ]; then
#	bt_conf=`cat /pref/bt.conf | grep -Ev "^#"`
#	export `echo "${bt_conf}"|grep -vI $'^\xEF\xBB\xBF'`
#
#	if [ "${PSCAN}" == "yes" ] && [ "${ISCAN}" == "yes" ] && [ $BT_DISCOVERABLE_TIMEOUT -eq 0 ]; then
#		hciconfig hci0 piscan
#	elif [ "${ISCAN}" == "yes" ] && [ $BT_DISCOVERABLE_TIMEOUT -eq 0 ]; then
#		hciconfig hci0 iscan
#	elif [ "${PSCAN}" == "yes" ]; then
#		hciconfig hci0 pscan
#	fi
#fi
