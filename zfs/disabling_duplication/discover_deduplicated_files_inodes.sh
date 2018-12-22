#!/bin/bash
# discovers inodes in zfs filesystem
echo "{"
echo "    \"$1/\": ["
first=true
zdb -dd "$1/" | grep -P "(?:ZFS (?:directory|file))" | while read -r line
do
	if ${first}; then
		first=false
	else
		echo ","
	fi
	inode=$(echo ${line} | grep -Po "^\d+")
echo -n "        ${inode}"
done
echo
echo "    ]"
echo "}"
