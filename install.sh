#!/bin/bash

DIR=$(dirname $0)
NAME=$(basename $0)

# Define config list. 
# Cleanup old configs, then link a new one.
for entry in `ls $DIR`
do
	if [ $NAME == $entry ]; then
		echo "Ignore $NAME script"
		continue
	fi
	entryLocation=`pwd $DIR`/"$entry"
	if [ "java.zsh" == $entry ]; then
		customConfigLocation = ~/.oh-my-zsh/custom/$entry
		rm $customConfigLocation
		echo "Create a symbolic link for $customConfigLocation"
		ln -s $entryLocation $customConfigLocation
		continue
	fi
	dotEntry=".$entry"
	echo "Remove old config file for $dotEntry"
	rm ~/"$dotEntry"
	echo "Create a symbolic link $dotEntry for a new config located in $entryLocation"
	ln -s $entryLocation ~/"$dotEntry"
done
