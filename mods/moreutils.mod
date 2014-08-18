#!/bin/bash
if [[ -n `which ifdata` ]]; then

	alias ifips='_ifips '

	_ifips () {
		#case $OSUNAME in 
		#	Darwin) IFACES=`ifconfig | grep mtu | cut -d : -f 1`;;
		#	Linux)	IFACES=`ls -1 /sys/class/net`;;
		#esac

		for IFACE in `ifconfig | grep mtu | cut -d : -f 1`; do
			printf "%-16s %s\n" "$IFACE" "`ifdata -pa $IFACE`"
		done
	}
fi