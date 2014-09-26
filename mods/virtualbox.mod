#!/usr/bin/env bash

if [[ -x /usr/bin/vboxmanage ]]; then

	alias lsvm='_lsvm'
	alias svm='_svm'

	_lsvm() {
		vboxmanage list vms | cut -f 1 -d\ | tr -d '"'
	}

	_svm() {
		if [[ -n $1 ]]; then
		    vboxmanage startvm "$1" --type headless
		else
			echo "Name of VM not given"
			_lsvm
		fi
	}
fi
