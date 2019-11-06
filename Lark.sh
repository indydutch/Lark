#!/bin/bash
# Lark.sh

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2)
NC=$(tput setaf 7)
BLINK=$(tput blink)

brk=false
#user start
#while [ "$brk" == false ]; do
select option in play readme; do
	case $option in
		"play")
			break
		;;
		"readme")
			cat readme
		;;
		*)
		;;
	esac
done

echo
read -p "What is your name? " userName
cat gertrude | less

tput setaf 7

hasFolder=false
command=""
while [ "$hasFolder" == "false" ]; do
	read -p "Do you have a save folder already? (y/n) " folderName
	case "$folderName" in
		y|Y)
			read -p "What's your save folder called? " folderName
			if [ -d  "$PWD/$folderName" ]; then
				echo "Alright, let's get started."
				hasFolder=true
			else
				echo "Uh oh. It looks like that directory doesn't exist yet."
			fi
		;;
		n|N)
			echo -e "Let's fix that. Why don't you ${GREEN}m${NC}a${GREEN}k${NC}e a new ${GREEN}dir${NC}ectory."
			read -p "${GREEN}mkdir${NORMAL} " folderName
			if [ "$folderName" == "q" ] || [ "$folderName" == "Q" ]; then
				exit
			fi
			./makeGarden.sh $folderName
			hasFolder=true
		;;
		q|Q)
			exit
		;;
		*)
			echo "Not a valid option, please try again."
		;;
	esac
done

for((i = 1; i < 15; i++)); do
	if [ $i == 1 ]; then
		echo
		echo "Every day you can choose a cat to talk to and ask them to ${GREEN}l${NC}i${GREEN}s${NC}t their services."
	fi
	select option in Maximus Cat2 Cat3 Cat4 Cat5 Cat6 Cat7 Cat8 Cat9; do
		case $option in
			"Maximus")
				break
			;;
			"Cat2")
				break
			;;
			"Cat3")
				break
			;;
			"Cat4")
				break
			;;
			"Cat5")
				break
			;;
			"Cat6")
				break
			;;
			"Cat7")
				break
			;;
			"Cat8")
				break
			;;
			"Cat9")
				break
			;;
			q|Q)
				exit
			;;
			*)
			;;
		esac
	done
done



