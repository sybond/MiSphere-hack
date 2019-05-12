# Xiaomi MiSphere Bluetooth Hack

#### Linux build information

`Linux a12 3.10.71 #1 PREEMPT Mon May 14 10:05:28 UTC 2018 armv7l GNU/Linux`

- Linux A12 3.10.71
- ARMv7

#### Mount Point

```shell
Filesystem                Size      Used Available Use% Mounted on
ubi0:linux               41.7M     20.0M     21.6M  48% /
devtmpfs                 25.9M         0     25.9M   0% /dev
tmpfs                    25.9M         0     25.9M   0% /dev/shm
tmpfs                    25.9M     24.0K     25.9M   0% /tmp
a:                       62.7M    804.0K     62.0M   1% /tmp/FL0
c:                       14.7G      6.2G      8.5G  42% /tmp/SD0
a:                       62.7M    804.0K     62.0M   1% /pref
c:                       14.7G      6.2G      8.5G  42% /tmp/lib/bluetooth/??:??:??:??:??:??
```
The Micro SD card is mounted at `/tmp/SD0/` mounted as `c:`.

#### WiFi AP

 - **SSID:** `MJXJ-_[user defined]`
 - **Default pass:** `1234567890`
 - **Securtiy:** WPA2-Personal
 - **Camera IP:** `192.168.42.1`
 - **Live RTSP:** `rtsp://192.168.42.1/live`

#### Nmap scan:

```shell
Starting Nmap 7.01 ( https://nmap.org ) at 2019-05-12 08:48 WIB
Nmap scan report for 192.168.42.1
Host is up (0.041s latency).
Not shown: 995 closed ports
PORT     STATE SERVICE
53/tcp   open  domain
111/tcp  open  rpcbind
443/tcp  open  https
554/tcp  open  rtsp
9898/tcp open  monkeycom
7878/tcp open  UNKNOWN     <---- RTOS communication using JSON message via TCP socket
```

Some details about JSON format [here](somewhere).

#### Shell access

Currently not enabled.

#### Bootlog

```sh
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.10.71 (fx@fx-madv) (gcc version 4.9.2 20140904 (prerelease) (crosstool-NG linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09) ) #1 PREEMPT Mon May 14 10:05:28 UTC 2018
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine: Ambarella S2L (Flattened Device Tree), model: Ambarella A12 Dragonfly Board
[    0.000000] boss: bc550000 [1c550000]
[    0.000000] aipc_spin_lock_setup done
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] Ambarella:      AHB = 0xe0000000[0xe0000000],0x08000000 0
[    0.000000] Ambarella:      APB = 0xe8000000[0xe8000000],0x01000000 0
[    0.000000] Ambarella:      PPM = 0x1c000000[0xbc000000],0x00600000 9
[    0.000000] Ambarella:     PPM2 = 0x00001000[0xa0001000],0x1bfff000 9
[    0.000000] Ambarella:      AXI = 0xf0000000[0xf0000000],0x00100000 0
[    0.000000] aipc: smem: 0xbc000000 [0x1c000000], 0x1c600000
[    0.000000] On node 0 totalpages: 14848
[    0.000000] free_area_init_node: node 0, pgdat 4058826c, node_mem_map 405b8000
[    0.000000]   Normal zone: 116 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 14848 pages, LIFO batch:3
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 14732
[    0.000000] Kernel command line: ubi.mtd=8 root=ubi0:linux rootfstype=ubifs nr_cpus=1 maxcpus=0 boss=0xbc550000
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 58MB = 58MB total
[    0.000000] Memory: 52972k/52972k available, 6420k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0x44000000 - 0xa0000000   (1472 MB)
[    0.000000]     lowmem  : 0x40000000 - 0x43a00000   (  58 MB)
[    0.000000]     modules : 0x3f000000 - 0x40000000   (  16 MB)
[    0.000000]       .text : 0x40008000 - 0x40531af8   (5287 kB)
[    0.000000]       .init : 0x40532000 - 0x40555bbc   ( 143 kB)
[    0.000000]       .data : 0x40556000 - 0x40594458   ( 250 kB)
[    0.000000]        .bss : 0x40594458 - 0x405b383c   ( 125 kB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:288
[    0.000000] sched_clock: 32 bits at 108MHz, resolution 9ns, wraps every 39768ms
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty0] enabled
[    0.002195] Calibrating delay loop... 388.30 BogoMIPS (lpj=1941504)
[    0.097739] pid_max: default: 32768 minimum: 301
[    0.098136] Mount-cache hash table entries: 512
[    0.099209] CPU: Testing write buffer coherency: ok
[    0.099743] Setting up static identity map for 0x4040eaf0 - 0x4040eb58
[    0.107377] devtmpfs: initialized
[    0.118502] pinctrl core: initialized pinctrl subsystem
[    0.140313] NET: Registered protocol family 16
[    0.140858] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.143431] L310 cache controller enabled
[    0.143475] l2x0: 8 ways, CACHE_ID 0x410000c8, AUX_CTRL 0x22020000, Cache size: 131072 B
[    0.153044] ambarella-pinctrl e8009000.pinctrl: Ambarella pinctrl driver registered
[    0.155413] ambarella-gpio gpio.0: Ambarella GPIO driver registered
[    0.167061] aipc_mutex_init done
[    0.214999] bio: create slab <bio-0> at 0
[    0.217793] ambarella-dma e0005000.dma: Ambarella DMA Engine 
[    0.223772]  remoteproc0: c0_and_c1 is available
[    0.223825]  remoteproc0: Note: remoteproc is still under development and considered experimental.
[    0.223856]  remoteproc0: THE BINARY FORMAT IS NOT YET FINALIZED, and backward compatibility isn't yet guaranteed.
[    0.224473]  remoteproc0: registered virtio0 (type 7)
[    0.225513]  remoteproc0: powering up c0_and_c1
[    0.225557]  remoteproc0: Booting fw image dummy, size 0
[    0.226874] virtio_rpmsg_bus virtio0: rpmsg host is online
[    0.227564] NS announcement: 41 6d 62 61 52 70 64 65 76 5f 43 4c 4b 00 ef ef  AmbaRpdev_CLK...
[    0.227588] NS announcement: ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef  ................
[    0.227602] NS announcement: 00 04 00 00 00 00 00 00                          ........
[    0.227625] virtio_rpmsg_bus virtio0: creating channel AmbaRpdev_CLK addr 0x400
[    0.229422] Bluetooth: Core ver 2.16
[    0.229838] NET: Registered protocol family 31
[    0.229871] Bluetooth: HCI device and connection manager initialized
[    0.229915] Bluetooth: HCI socket layer initialized
[    0.230211] Bluetooth: L2CAP socket layer initialized
[    0.230289] Bluetooth: SCO socket layer initialized
[    0.232430] NS announcement: 61 69 70 63 5f 72 70 63 00 00 00 00 b6 00 00 00  aipc_rpc........
[    0.232455] NS announcement: ca 00 00 00 de 00 00 00 e2 00 00 00 ee 00 00 00  ................
[    0.232470] NS announcement: 01 04 00 00 00 00 00 00                          ........
[    0.232492] virtio_rpmsg_bus virtio0: creating channel aipc_rpc addr 0x401
[    0.233054] Switching to clocksource ambarella-cs-timer
[    0.282526] NET: Registered protocol family 2
[    0.285089] TCP established hash table entries: 512 (order: 0, 4096 bytes)
[    0.285151] TCP bind hash table entries: 512 (order: -1, 2048 bytes)
[    0.285183] TCP: Hash tables configured (established 512 bind 512)
[    0.285328] TCP: reno registered
[    0.285360] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.285398] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.285839] NET: Registered protocol family 1
[    0.286832] RPC: Registered named UNIX socket transport module.
[    0.286879] RPC: Registered udp transport module.
[    0.286901] RPC: Registered tcp transport module.
[    0.286919] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.287581] ambarella-sd e000c000.sdmmc1: Slot0 use bounce buffer[0x43380000<->0x1f980000]
[    0.287629] ambarella-sd e000c000.sdmmc1: Slot0 req_size=0x00020000, segs=32, seg_size=0x00020000
[    0.287725] ambarella-sd e000c000.sdmmc1: Slot0 use ADMA
[    0.363362] ambarella-sd e000c000.sdmmc1: 1 slots @ 48000000Hz
[    0.365205] NS announcement: 61 69 70 63 5f 76 66 73 00 ef ef ef ef ef ef ef  aipc_vfs........
[    0.365234] NS announcement: ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef  ................
[    0.365247] NS announcement: 02 04 00 00 00 00 00 00                          ........
[    0.365271] virtio_rpmsg_bus virtio0: creating channel aipc_vfs addr 0x402
[    0.375119] msgmni has been set to 103
[    0.380714] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.380775] io scheduler noop registered
[    0.380798] io scheduler deadline registered
[    0.380868] io scheduler cfq registered (default)
[    0.382052] e0032000.uart: ttyS1 at MMIO 0xe0032000 (irq = 25) is a ambuart
[    0.386250] brd: module loaded
[    0.396966] loop: module loaded
[    0.397554] Probe amba_heapmem successfully
[    0.398527] Probe amba_dspmem successfully
[    0.401942] ambarella-nand e0001000.nand: in ecc-[6]bit mode
[    0.401988] ambarella_nand: Use On Flash BBT
[    0.402296] NAND device: Manufacturer ID: 0x01, Chip ID: 0xda (AMD/Spansion NAND 256MiB 3,3V 8-bit), 256MiB, page size: 2048, OOB size: 64
[    0.402714] Bad block table found at page 131008, version 0xFF
[    0.404930] Bad block table found at page 130944, version 0xFF
[    0.406965] 10 ofpart partitions found on MTD device amba_nand
[    0.407004] Creating 10 MTD partitions on "amba_nand":
[    0.407035] 0x000000000000-0x000000020000 : "Bootstrap"
[    0.409705] 0x000000020000-0x000000060000 : "Partition Table"
[    0.414842] 0x000000060000-0x0000000a0000 : "Bootloader"
[    0.417875] 0x0000000a0000-0x0000003a0000 : "SD Firmware Update Code"
[    0.420741] 0x0000003a0000-0x000000da0000 : "System Software"
[    0.424322] 0x000000da0000-0x0000015a0000 : "DSP uCode"
[    0.426853] 0x0000015a0000-0x000001fa0000 : "System ROM Data"
[    0.429163] 0x000001fa0000-0x0000029a0000 : "Linux Kernel"
[    0.431565] 0x0000029a0000-0x0000065a0000 : "Linux Root FS"
[    0.434913] 0x0000065a0000-0x0000083a0000 : "Linux Hibernation Image"
[    0.437906] ambarella-eth e000e000.ethernet: Not enabled, check HW config!
[    0.437974] ambarella-eth: probe of e000e000.ethernet failed with error -1
[    0.440427] mousedev: PS/2 mouse device common for all mice
[    0.441313] ambarella-rtc e8015000.rtc: rtc core: registered rtc-ambarella as rtc0
[    0.441808] Bluetooth: HCI UART driver ver 2.2
[    0.441844] Bluetooth: HCI H4 protocol initialized
[    0.441863] Bluetooth: HCI BCSP protocol initialized
[    0.441880] Bluetooth: HCILL protocol initialized
[    0.441896] Bluetooth: HCIATH3K protocol initialized
[    0.441914] Bluetooth: HCI Three-wire UART (H5) protocol initialized
[    0.441933] Bluetooth: MSM Sleep Mode Driver Ver 1.1
[    0.443055] hidraw: raw HID events driver (C) Jiri Kosina
[    0.451749] TCP: cubic registered
[    0.451790] Initializing XFRM netlink socket
[    0.451881] NET: Registered protocol family 17
[    0.451980] NET: Registered protocol family 15
[    0.452431] Bluetooth: RFCOMM TTY layer initialized
[    0.452517] Bluetooth: RFCOMM socket layer initialized
[    0.452544] Bluetooth: RFCOMM ver 1.11
[    0.452566] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    0.452607] Bluetooth: HIDP socket layer initialized
[    0.452767] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 4
[    0.452827] ThumbEE CPU extension supported.
[    0.452882] Registering SWP/SWPB emulation handler
[    0.457475] UBI: default fastmap pool size: 20
[    0.457525] UBI: default fastmap WL pool size: 25
[    0.457548] UBI: attaching mtd8 to ubi0
[    0.630905] UBI: scanning is finished
[    0.643314] UBI: attached mtd8 (name "Linux Root FS", size 60 MiB) to ubi0
[    0.643359] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    0.643384] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    0.643406] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    0.643427] UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
[    0.643447] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
[    0.643471] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 1431031247
[    0.643498] UBI: available PEBs: 45, total reserved PEBs: 435, PEBs reserved for bad PEB handling: 40
[    0.643571] ambarella-rtc e8015000.rtc: setting system clock to 2018-10-29 09:23:39 UTC (1540805019)
[    0.644589] UBI: background thread "ubi_bgt0d" started, PID 405
[    0.770329] UBIFS: mounted UBI device 0, volume 0, name "linux", R/O mode
[    0.770377] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    0.770407] UBIFS: FS size: 47996928 bytes (45 MiB, 378 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    0.770434] UBIFS: reserved for root: 0 bytes (0 KiB)
[    0.770458] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 438E8838-2CB9-4B12-90AA-697A3283E9D0, small LPT model
[    0.772321] VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
[    0.786904] devtmpfs: mounted
[    0.787344] Freeing unused kernel memory: 140K (40532000 - 40555000)
[    3.031106] NS announcement: 61 69 70 63 5f 72 66 73 00 ef ef ef ef ef ef ef  aipc_rfs........
[    3.031135] NS announcement: ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef ef  ................
[    3.031149] NS announcement: 03 04 00 00 00 00 00 00                          ........
[    3.031171] virtio_rpmsg_bus virtio0: creating channel aipc_rfs addr 0x403
[    3.034204] NS announcement: 41 6d 62 61 52 70 64 65 76 5f 4c 69 6e 6b 43 74  AmbaRpdev_LinkCt
[    3.034233] NS announcement: 72 6c 00 ef ef ef ef ef ef ef ef ef ef ef ef ef  rl..............
[    3.034247] NS announcement: 04 04 00 00 00 00 00 00                          ........
[    3.034271] virtio_rpmsg_bus virtio0: creating channel AmbaRpdev_LinkCtrl addr 0x404
[    3.074577] NS announcement: 65 63 68 6f 5f 63 6f 72 74 65 78 00 00 00 00 00  echo_cortex.....
[    3.074607] NS announcement: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    3.074620] NS announcement: 05 04 00 00 00 00 00 00                          ........
[    3.075677] virtio_rpmsg_bus virtio0: creating channel echo_cortex addr 0x405
[    3.443805] cfg80211: Calling CRDA to update world regulatory domain
[    3.871418] PM: Syncing filesystems ... done.
[    3.871773] Freezing user space processes ... (elapsed 0.03 seconds) done.
[    3.903371] rpmsg_linkctrl_cmd_hiber_prepare: 0x1cb94920
[    3.903782] PM: Preallocating image memory... done (allocated 3386 pages)
[    3.923546] PM: Allocated 13544 kbytes in 0.01 seconds (1354.40 MB/s)
[    3.923570] Freezing remaining freezable tasks ... (elapsed 0.02 seconds) done.
[    3.944073] Suspending console(s) (use no_console_suspend to debug)
[    3.945262] PM: freeze of devices complete after 1.145 msecs
[    3.945838] PM: late freeze of devices complete after 0.561 msecs
[    3.947040] PM: noirq freeze of devices complete after 1.187 msecs
[    3.947128] PM: Creating hibernation image:
[    3.947128] PM: Need to copy 3371 pages
[    3.947128] pm_abaoss_entry returned 0x1
[    7.896920] PM: noirq restore of devices complete after 0.165 msecs
[    7.897408] PM: early restore of devices complete after 0.142 msecs
[    7.911121] PM: restore of devices complete after 1.373 msecs
[    7.911397] rpmsg_linkctrl_cmd_hiber_exit:
[    7.911917] Restarting tasks ... done.
[    9.462774] bluesleep_start() t gpio23 sw out0
```

#### Directory Structure

In file: `root_structure.txt`

#### Known information for now...

- It using *Ambarella RTOS* Shell to allow external contact with Linux system
- All material extracted using `/tmp/SD0/autexec.ash` script, that will be executed every time the device turned on
- Bluetooth name defined in `/pref/bt.conf` file



#### TO-DO

- Find how Bluetooth works
- Get some experiments:
  - Pairing 3rd party bluetooth remote control
  - Sniffing bluetooth data