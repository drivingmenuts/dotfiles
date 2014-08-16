#!/bin/bash
if [[ -x /usr/bin/vboxmanage ]]; then

	alias lsvm='_lsvm'
	alias svm='_svm'

	_lsvm() {
		vboxmanage list vms | cut -f 1 -d\ | tr -d '"'
	}

	_svm() {
	        vboxmanage startvm $1 --type headless
	}
fi
