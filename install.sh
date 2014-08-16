#!/bin/bash
if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $PWD/.holdfiles
	cp ~/.bash* $PWD/.holdfiles
	cp ~/.inputrc $PWD/.holdfiles
else
	echo Failed.
fi
