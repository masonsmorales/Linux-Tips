#!/usr/bin/env bash
# Generic script to replace strings in a list of files/filename patterns using find and sed
# Author: Mason Morales
# Note: files.txt should be a list of filenames with a line break after each file
file="$(cat update_files.txt)"

original="index=test"
replacement="index=_internal"

echo "=========== Script Started ==========="
echo "Beginning string replacement for all files listed in $file"
echo "Replacing $original with $replacement ..."

for f in $file
do
echo "-----------"
	echo "Updating file: $(find $(pwd) -name "$f" -type f)"
	find $(pwd) -name "$f" -type f -exec sed -i '' -e "s/$original/$replacement/g" {} \;
done

echo "=========== Done! ==========="
