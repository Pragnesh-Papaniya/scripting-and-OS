#!/bin/bash



# Database credentials

USER='root'

PASSWORD='147963'

HOST='localhost'



# Function to show the menu

function show_menu() {

    echo "Simple DBMS Operations"

    echo "======================"

    echo "1. Create Database"

    echo "2. Create Table"

    echo "3. Insert Data into Table"

    echo "4. Display Data from Table"

    echo "5. Delete Record from Table"

    echo "6. Exit"

    echo "======================"

    echo -n "Choose an option: "

}



# Function to create a database

function create_database() {

    echo -n "Enter the name of the database to create: "

    read db_name

    QUERY="CREATE DATABASE IF NOT EXISTS $db_name;"

    mysql -u $USER -p$PASSWORD -e "$QUERY"

    if [ $? -eq 0 ]; then

        echo "Database '$db_name' created successfully."

    else

        echo "Failed to create database '$db_name'."

    fi

}



# Function to create a table

function create_table() {

    echo -n "Enter the database name: "

    read db_name

    echo -n "Enter the table name: "

    read table_name

    echo -n "Enter the table schema (e.g., id INT, name VARCHAR(100)): "

    read table_schema

    QUERY="CREATE TABLE IF NOT EXISTS $table_name ($table_schema);"

    mysql -u $USER -p$PASSWORD -D $db_name -e "$QUERY"

    if [ $? -eq 0 ]; then

        echo "Table '$table_name' created successfully in database '$db_name'."

    else

        echo "Failed to create table '$table_name'."

    fi

}



# Function to insert data into a table

function insert_data() {

    echo -n "Enter the database name: "

    read db_name

    echo -n "Enter the table name: "

    read table_name

    echo -n "Enter data to insert (comma-separated, e.g., 1, 'John Doe'): "

    read data

    QUERY="INSERT INTO $table_name VALUES($data);"

    mysql -u $USER -p$PASSWORD -D $db_name -e "$QUERY"

    if [ $? -eq 0 ]; then

        echo "Data inserted successfully into table '$table_name'."

    else

        echo "Failed to insert data."

    fi

}



# Function to display data from a table

function display_data() {

    echo -n "Enter the database name: "

    read db_name

    echo -n "Enter the table name: "

    read table_name

    QUERY="SELECT * FROM $table_name;"

    mysql -u $USER -p$PASSWORD -D $db_name -e "$QUERY"

    if [ $? -eq 0 ]; then

        echo "Data displayed successfully."

    else

        echo "Failed to display data."

    fi

}



# Function to delete a record from a table

function delete_record() {

    echo -n "Enter the database name: "

    read db_name

    echo -n "Enter the table name: "

    read table_name

    echo -n "Enter the condition to delete (e.g., id=1): "

    read condition

    QUERY="DELETE FROM $table_name WHERE $condition;"

    mysql -u $USER -p$PASSWORD -D $db_name -e "$QUERY"

    if [ $? -eq 0 ]; then

        echo "Record deleted successfully from table '$table_name'."

    else

        echo "Failed to delete record."

    fi

}



# Main script loop

while true; do

    show_menu

    read option

    case $option in

        1) create_database ;;

        2) create_table ;;

        3) insert_data ;;

        4) display_data ;;

        5) delete_record ;;

        6) echo "Exiting."; exit 0 ;;

        *) echo "Invalid option. Please try again." ;;

    esac

    echo

done

