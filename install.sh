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

	dotEntry=".$entry"

	echo "Remove old config file for $dotEntry"
	rm ~/"$dotEntry"

	entryLocation=`pwd $DIR`/"$entry"
	echo "Create a symbolic link $dotEntry for a new config located in $entryLocation"
	ln -s $entryLocation ~/"$dotEntry"
done

# Download bullet-train theme.
bulletTrain="bullet-train.zsh-theme"
bulletTrainDir="$ZSH"/themes/
if [ ! -f $bulletTrainDir/$bulletTrain ]; then 
	echo "Download $bulletTrain oh-my-zsh theme and install it to $bulletTrainDir"
	curl -o $bulletTrainDir/$bulletTrain https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
fi