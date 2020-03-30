#!/usr/bin/env bash
# Simple script to replace strings in a list of files/filename patterns using find and sed
# Author: Mason Morales
# Note: update_files.txt should be a list of filenames with a line break after each filename/pattern
file="$(cat update_files.txt)"

original="index=test"
replacement="index=_internal"

echo "=========== Script Started ==========="
echo "Beginning string replacement for the following file patterns:"
echo "$file"
echo "Replacing $original with $replacement"


for f in $file
do
        echo "-----------"

        # List files that will get updated
        echo "The following files will be updated......"
        matches="$(find $(pwd) -name "$f" -type f -exec grep -l "$original" {} \;)"

        if [ -z "$matches" ]
        then
                echo "No files with pattern \"file\" were found to contain the string \"$original\""
        else
                echo "$matches"
                # Perform replacement operation
                for x in $matches
                do
                        sed -i -e "s/$original/$replacement/g" $x
                done
                echo "-----------"
                echo "Note: You may have to edit and re-execute this script if you are replacing key/value pairs, and the value may contain quotes."
        fi

done
echo "=========== Done! ==========="
