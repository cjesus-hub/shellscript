#!/bin/bash
#simple countdount  timer
if [ "$#" -ne "3" ]; then
	echo "wrong arg count..."
	echo "run as such: ./${0} <hour digit> < minute digit> <seconds digit>"
	exit -1
fi

if [[ ! -z ${1//[0-9]} || ! -z ${2//[0-9]} || ! -z ${3//[0-9]} ]]; then
	echo Args must be digits...
	echo "run as susch: ${0} <hour digit> < minute digit> <seconds digit>"
	exit -1
fi

hour=$1
min=$2
sec=$3

function time_counter() {
	while [[ $hour -ge 0 ]]; do
		while [[ $min -ge 0 ]]; do
			while [[ $sec -ge 0 ]]; do
				echo -ne "$hour:$min:$sec\033[0K\r"
				let "sec=sec-1"
				sleep 1
			done
			sec=59
			let "min=min-1"
		done
		min=59
		let "hour=hour-1"
	done
}

time_counter
