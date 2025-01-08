#!/bin/bash
#
#

<<Disclaimer:
This script is used for user management.
We can create, modify, or delete users as per requirement.

For Create User, press C
For Modify User, press M
For Delete User, press D

Disclaimer:

echo "For Create User, press C"
echo "For Modify User, press M"
echo "For Delete User, press D"

# Function to create a user
function usercreate {
read -rep $'Please enter the username you want to create:\n' add

    sudo useradd -m "$add"
if [ $? -eq 0 ]; then
        echo "User $add has been created successfully."
    else
        echo "User $add could not be created."
 fi
}

# Function to delete a user
function userdelete {
    read -rep $'Please enter the username you want to remove:\n' delete

    sudo userdel -r "$delete"
    if [ $? -eq 0 ]; then
        echo "User $delete has been removed successfully."
    else
        echo "User $delete could not be removed."
    fi
}

# Function to modify a user
function usermodify {
    echo "Modify user functionality is under development."
    # Add your modification logic here if needed
}

while true; do
    echo -e "\nSelect an option:"
    echo "C) Create User"
    echo "M) Modify User"
    echo "D) Delete User"
    echo "Q) Quit"

    read -rp "Enter your choice: " choice

    case $choice in
        C|c)
            echo "Welcome to User Management: Create User"
            usercreate
            ;;
        D|d)
            echo "Welcome to User Management: Delete User"
            userdelete
            ;;
        M|m)
            echo "Welcome to User Management: Modify User"
            usermodify
            ;;
        Q|q)
            echo "Exiting... Goodbye!"
            break
            ;;
        *)
            echo "Please select a valid option."
            ;;
    esac
done
