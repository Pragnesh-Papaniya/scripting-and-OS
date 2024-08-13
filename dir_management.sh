#!/bin/bash

echo "exp4: Write a shell script for implementing directory management." 



# Function to display the menu

function show_menu() {

    echo "Directory Management System"

    echo "==========================="

    echo "1. Create a directory"

    echo "2. Delete a directory"

    echo "3. List directories"

    echo "4. Create a file"

    echo "5. List file contents"

    echo "6. Exit"

    echo "==========================="

    echo -n "Choose an option: "

}



# Function to create a directory

function create_directory() {

    echo -n "Enter the directory name to create: "

    read dir_name

    if [ -d "$dir_name" ]; then

        echo "Directory already exists."

else

        mkdir "$dir_name"

        echo "Directory '$dir_name' created."

    fi

}



# Function to delete a directory

function delete_directory() {

    echo -n "Enter the directory name to delete: "

    read dir_name

    if [ -d "$dir_name" ]; then

        rmdir "$dir_name"

        if [ $? -eq 0 ]; then

            echo "Directory '$dir_name' deleted."

        else

            echo "Directory '$dir_name' is not empty."

        fi

    else

        echo "Directory does not exist."

    fi

}



# Function to list directories

function list_directories() {

    echo "Listing directories:"

    ls -d */

}



# Function to create a file

function create_file() {

    echo -n "Enter the file name to create: "

    read file_name

    if [ -f "$file_name" ]; then

        echo "File already exists."

    else

        echo -n "Enter content for the file (Ctrl+D to save): "

        cat > "$file_name"

        echo "File '$file_name' created."

    fi

}



# Function to list the contents of a file

function list_file_contents() {

    echo -n "Enter the file name to list its contents: "

    read file_name

    if [ -f "$file_name" ]; then

        echo "Contents of '$file_name':"

        cat "$file_name"

    else

        echo "File does not exist."

    fi

}



# Main script loop

while true; do

    show_menu

    read option

    case $option in

        1) create_directory ;;

        2) delete_directory ;;

        3) list_directories ;;

        4) create_file ;;

        5) list_file_contents ;;

        6) echo "Exiting."; exit 0 ;;

        *) echo "Invalid option. Please try again." ;;

    esac

    echo

done