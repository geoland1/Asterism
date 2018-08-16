#!/bin/bash

# Asterism - DSLR RAW data calibration/reduction script
#   Copyright (C) 2015  Rowland Cheshire

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

# copy to install script

PWD=$(pwd)

	DESKTOP=$DESKTOP_SESSION

	if [[ -x /usr/bin/gksudo ]]; then
	SUDOTYPE=gksudo; else
	if [[ -x /usr/bin/kdesudo ]]; then
	SUDOTYPE=kdesudo; else
	yad --info --title="DEPENDENCY NOT MET" --text="Asterism will not be installed! Desktop Session is $DESKTOP - KDE requires kdesudo. Alternatively, install gksu for other desktops or run Asterism with no installation from folder" --button=OK:1
	fi
fi

	if [ $? = 1 ]; then
	exit 1; else
	echo " " >/dev/null 2>&1
	fi

FILE=$PWD/GPLv3.txt

yad --text-info \
	--title="License" \
	--height=400 \
	--width=300 \
	--filename=$FILE \
	--wrap \
	--margins=10 \
	--justify=fill \
	--button=Cancel:1 \
	--button=Agree:0 
	

	if [ $? = 1 ]; then
	exit 1; else
	echo " " >/dev/null 2>&1
	fi

# file install list
		declare -a files=(INSTALL/asterism Asterism AsterismLOGOsplash.png AsterismLOGOs.png autowhite conversion colorbalance curves denoise dmbilinear dmmalvar help.txt histogram inspect pmstack)

# file install directory
		declare -a DIR=(/usr/local/bin/)		

# Prompt for the password. Replace "the process" with a meaningful message.
		SUDOPASSWORD="$( $SUDOTYPE --print-pass --message 'Type your password, or press Cancel.' -- : 2>/dev/null )"

# Check for null entry or cancellation.
		if [[ ${?} != 0 || -z ${SUDOPASSWORD} ]]; then
    		exit 4
		fi

# Check that the password is valid.
		if ! sudo -kSp '' [ 1 ] <<<"${SUDOPASSWORD}" 2>/dev/null
		then
# Add a zenity message here if you want.
   		exit 4
		fi

		echo -e $SUDOPASSWORD | sudo -S cp ${files[@]} $DIR

		if [[ $DIR/"${files[@]}" ]];
		then
		yad --info --title=Asterism --text="Asterism Installed" --button=OK; else
		yad --info --title=Asterism --text="Asterism Not Installed" --button=OK
		fi

yad --question --title=Asterism --text="Create Asterism Link to Desktop" --button=No:1 --button=Yes:0 

 		if [ $? = 1 ]; then
		exit 1; else
		cp Asterism.desktop ~/Desktop	
		fi

trap EXIT
