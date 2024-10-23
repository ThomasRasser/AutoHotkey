#!/bin/bash

# Ensure a name is provided
if [ -z "$1" ]; then
    echo "Error: No name provided."
    exit 1
fi

name="$1"
name=$(echo "$name" | awk '{print toupper(substr($0, 1, 1))substr($0, 2)}')
template_file="Template.ahk"
current_date=$(date +"%d-%m-%Y %H:%M")
base_dir="."

# Ensure the template file exists
if [ ! -f "$template_file" ]; then
    echo "Error: Template file $template_file not found."
    exit 1
fi

# Check if the user has the necessary permissions
if [ ! -w "$base_dir" ]; then
    echo "Error: No write permission in the base directory."
    exit 1
fi

# Get the folder with the highest number in front
highest_number=$(ls -d [0-9]*_* 2>/dev/null | sort -V | tail -n 1 | cut -d'_' -f 1)

if [ -z "$highest_number" ]; then
    new_number=1
else
    new_number=$((highest_number + 1))
fi

# Create the new folder
new_folder="${new_number}_${name}"
mkdir "$new_folder"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory $new_folder."
    exit 1
fi

# Create the new AHK script file
file_name=$(echo "$name" | awk '{print tolower(substr($0, 1, 1))substr($0, 2)}')
script_file="${new_folder}/${file_name}.ahk"
cp "$template_file" "$script_file"

# Fill in the template with the provided information
sed -i "s/\[Script Name\]/${name}/g" "$script_file"
sed -i "s/\[Creation Date\]/${current_date}/g" "$script_file"

# Make the script executable
chmod +x "$script_file"
if [ $? -ne 0 ]; then
    echo "Error: Could not make the script executable."
    exit 1
fi

echo "Folder and script $script_file created successfully."
