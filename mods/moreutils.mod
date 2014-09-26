#!/usr/bin/env bash

if [[ -n `which ifdata` ]]; then

	alias ifips='_ifips '

	_ifips () {
		for IFACE in `ifconfig | grep mtu | cut -d : -f 1`; do
			printf "%-16s %s\n" "$IFACE" "`ifdata -pa $IFACE`"
		done
	}
fi
