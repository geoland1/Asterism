#!/bin/bash

# no AT bridge
	export NO_AT_BRIDGE=1

# monitor gamma log
	log=~/.asterism/gamma

# RGB adjust gamma
	yad --form --title="Monitor Gamma" --separator=':' --button=Quit:1 --button=Adjust:0 \
		--field="Red":NUM \
			'1.055!0.1..10!0.001!3' \
		--field="Green":NUM \
			'0.95!0.1..10!0.001!3' \
		--field="Blue":NUM \
			'1.000!0.1..10!0.001!3' > $log 2>/dev/null

# run quit gamma.sh
	if [[ $? = 1 || $? = 252 ]]; then
	exit 1; else
	echo " " >/dev/null 2>&1
	fi

	{ IFS=":" read r g b; } < $log

	echo $r $g $b

	red=$(echo "scale=3; $r" | bc)
	gre=$(echo "scale=3; $g" | bc)
	blu=$(echo "scale=3; $b" | bc)

	echo $red $grn $blu

	xgamma -rgamma $red -ggamma $grn -bgamma $blu

exit
