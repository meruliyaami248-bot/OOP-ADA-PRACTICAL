# Write a shell script to display all executable files, directories 
# and zero sized files from current directory

echo "Files in current directory:"

for file in *
do
    # Check if it is executable file
    if [ -f "$file" ] && [ -x "$file" ]
    then
        echo "Executable file: $file"
    fi

    # Check if it is directory
    if [ -d "$file" ]
    then
        echo "Directory: $file"
    fi

    # Check if it is zero size file
    if [ -f "$file" ] && [ ! -s "$file" ]
    then
        echo "Zero size file: $file"
    fi
done
