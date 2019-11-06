#!/bin/bash
# makeGarden.sh

#for production if in Lark.sh change to prefix="$PWD/$folderName"
prefix="$PWD/$1"
if [ -d "$prefix" ]; then
	read -p "Do you want to overwrite this existing save? (y/n) " overwrite
	case "$overwrite" in
		y|Y)
			rm -r $prefix
		;;
		n|N)
			read -p "Please enter a new save name: " prefix
			mkdir $prefix
		;;
		*)
			echo "That is not a valid option"
		;;
	esac
else
	mkdir $prefix
fi

mkdir $prefix/garden

trees=$((1 + RANDOM % 5))
nestCount=0
branchCount=0
#Trees
for((t = 0; t < trees; t++)); do
	mkdir $prefix/garden/tree$t
	branch1=$((1 + RANDOM % 5))
	for((b1 = 0; b1 < branch1; b1++)); do
		mkdir $prefix/garden/tree$t/branch$b1
		branch2=$((1 + RANDOM % 5))
		for((b2 = 0; b2 < branch2; b2++)); do
			mkdir $prefix/garden/tree$t/branch$b1/branch$b2
			nest=$((1 + RANDOM % 10))
			(( branchCount = $branchCount + 1 ))
			if [ ! -f nest ] && [ $nest == 1 ]; then
				(( nestCount = $nestCount + 1 ))
				nestArray[$nestCount]="$prefix/garden/tree$t/branch$b1/branch$b2/nest"
				touch $prefix/garden/tree$t/branch$b1/branch$b2/nest
				echo "BIRD!" > $prefix/garden/tree$t/branch$b1/branch$b2/nest
				nestArray[$nestCount]="$prefix/garden/tree$t/branch$b1/branch$b2/nest"
			fi
		done
	done
done

#echo "Branches: $branchCount || Nests: $nestCount"
#echo "${nestArray[@]}"