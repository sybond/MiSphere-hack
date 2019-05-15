# This autoexec ambshell script will enable Telnet Daemon in the device
# For MiSphere only.
# Copyright (c) 2019 Bondan Sumbodo <sybond@gmail.com>

sleep 5
t ipc rpc clnt exec2 '/usr/sbin/telnetd > /dev/null'
