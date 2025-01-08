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
    echo "Modify User Options:"
    echo "1) Change Home Directory"
    echo "2) Change Default Shell"
    echo "3) Add User to a Group"
    echo "4) Lock User Account"
    echo "5) Unlock User Account"
    echo "6) Rename User"
    echo "7) Rename Computer Hostname"
    echo "8) Exit"

    read -rp "Enter your choice: " modify_choice

    case $modify_choice in
        1)
            read -rp "Enter the username: " username
            read -rp "Enter the new home directory: " new_home
            sudo usermod -d "$new_home" -m "$username"
            echo "Home directory updated successfully."
            ;;
        2)
            read -rp "Enter the username: " username
            read -rp "Enter the new shell (e.g., /bin/bash): " new_shell
            sudo usermod -s "$new_shell" "$username"
            echo "Default shell updated successfully."
            ;;
        3)
            read -rp "Enter the username: " username
            read -rp "Enter the group to add the user to: " group
            sudo usermod -aG "$group" "$username"
            echo "User added to group successfully."
            ;;
        4)
            read -rp "Enter the username to lock: " username
            sudo usermod -L "$username"
            echo "User account locked successfully."
            ;;
        5)
            read -rp "Enter the username to unlock: " username
            sudo usermod -U "$username"
            echo "User account unlocked successfully."
            ;;
        6)
            read -rp "Enter the current username: " old_username
            read -rp "Enter the new username: " new_username
            sudo usermod -l "$new_username" "$old_username"
            echo "Username updated successfully."
	    ;;

    	7) 
	   read -rp "Enter the new Hostname: " new_hostname
	  
	   sudo hostnamectl set-hostname $new_hostname
	  echo "Hostname updated successfully."
	   ;;

      	8)  
       	   echo "Exiting user modification."
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
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
