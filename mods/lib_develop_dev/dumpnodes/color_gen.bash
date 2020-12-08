#!/bin/bash -e
AVGCOLOR_PATH= ./  # path to avgcolor.py
GAME_PATH= /  # path to minetest_game
MODS_PATH= /mods  # path to "mods" folder, only set if you have loaded mods
NODESTXT_PATH= /worlds/EMPTY_Patience/nodes.txt
COLORSTXT_PATH= /worlds/EMPTY_Patience/colors.txt

while read -r line; do
	set -- junk $line; shift
	if [[ -z "$1" || $1 == "#" ]]; then
		echo "$line"; continue
	fi
	tex=$(find $GAME_PATH -type f -name "$2")
	[[ -z "$tex" && -n "$MODS_PATH" ]] && tex=$(find $MODS_PATH -type f -name "$2")
	if [ -z "$tex" ]; then
		echo "skip $1: texture not found" >&2
		continue
	fi
	echo "$1" $(python $AVGCOLOR_PATH "$tex")
	echo "ok $1" >&2
done < $NODESTXT_PATH > $COLORSTXT_PATH
# Use nicer colors for water and lava:
sed -re 's/^default:((river_)?water_(flowing|source)) [0-9 ]+$/default:\1 39 66 106 128 224/g' $COLORSTXT_PATH -i
sed -re 's/^default:(lava_(flowing|source)) [0-9 ]+$/default:\1 255 100 0/g' $COLORSTXT_PATH -i
# Add transparency to glass nodes and xpanes:
sed -re 's/^default:(.*glass) ([0-9 ]+)$/default:\1 \2 64 16/g' $COLORSTXT_PATH -i
sed -re 's/^doors:(.*glass[^ ]*) ([0-9 ]+)$/doors:\1 \2 64 16/g' $COLORSTXT_PATH -i
sed -re 's/^xpanes:(.*(pane|bar)[^ ]*) ([0-9 ]+)$/xpanes:\1 \3 64 16/g' $COLORSTXT_PATH -i
# Delete some usually hidden nodes:
sed '/^doors:hidden /d' $COLORSTXT_PATH -i
sed '/^fireflies:firefly /d' $COLORSTXT_PATH -i