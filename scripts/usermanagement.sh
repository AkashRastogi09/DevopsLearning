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
if [ $? -eq 0 ]; then
        echo "Home directory updated successfully."
    else
        echo "Home directory Not updated successfully.."
 fi
            ;;


        2)
            read -rp "Enter the username: " username
            read -rp "Enter the new shell (e.g., /bin/bash): " new_shell
            sudo usermod -s "$new_shell" "$username"

if [ $? -eq 0 ]; then
        echo "Default shell updated successfully."
    else
        echo "Default shell Not updated successfully"
 fi
            ;;


        3)
            read -rp "Enter the username: " username
            read -rp "Enter the group to add the user to: " group
            sudo usermod -aG "$group" "$username"
if [ $? -eq 0 ]; then
        echo "User added to group successfully."
    else
        echo "User added to Not group successfully."
 fi
            ;;


        4)
            read -rp "Enter the username to lock: " username
            sudo usermod -L "$username"
if [ $? -eq 0 ]; then
        echo "User account locked successfully."
    else
        echo "User account Not locked successfully."
 fi
            ;;


        5)
            read -rp "Enter the username to unlock: " username
            sudo usermod -U "$username"
if [ $? -eq 0 ]; then
        echo "User account unlocked successfully."
    else
        echo "User account Not unlocked successfully."
 fi
            ;;


        6)
            read -rp "Enter the current username: " old_username
            read -rp "Enter the new username: " new_username
            sudo usermod -l "$new_username" "$old_username"
if [ $? -eq 0 ]; then
        echo "Username updated successfully."
    else
        echo "Username Not updated successfully."
 fi

	    ;;



    	7) 
	   read -rp "Enter the new Hostname: " new_hostname
	  
	   sudo hostnamectl set-hostname $new_hostname
if [ $? -eq 0 ]; then
        echo "Hostname updated successfully."
    else
        echo "Hostname Not updated successfully."
 fi
	   ;;



      	8)  
       	   echo "Exiting user modification."
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac


function Joindomain {

    : '
    Disclaimer:
    This function is created for adding a system to a domain.
    Please perform this carefully as it is a critical operation.
    '

    echo "---------------------------------------------------------------"
    echo "Prerequisites for joining a domain:"
    echo "1. Your domain FQDN should be discoverable on your connected network."
    echo "2. Your system should be connected to the internet."
    echo "3. Your system hostname should be correct."
    echo "---------------------------------------------------------------"

    # Step 1: Rename the system hostname
    echo "Step 1: Rename the system hostname"
    read -rp "Enter the new hostname: " new_hostname
    sudo hostnamectl set-hostname "$new_hostname"
    echo "Hostname has been updated to $new_hostname."

    # Step 2: Install necessary packages
    echo "Step 2: Installing necessary packages..."
    sudo apt-get update
    sudo apt-get -y install realmd libnss-sss libpam-sss sssd sssd-tools adcli samba-common-bin oddjob oddjob-mkhomedir packagekit

    if [ $? -eq 0 ]; then
        echo "All required packages have been installed successfully."
    else
        echo "Failed to install required packages. Please check your internet connection or package manager."
        return 1
    fi

    # Step 3: Discover the domain
    echo "Step 3: Discovering the domain..."
    read -rp "Enter your FQDN domain name: " domain_name
    sudo realm discover "$domain_name"

    if [ $? -eq 0 ]; then
        echo "Domain $domain_name has been discovered successfully."
    else
        echo "Failed to discover domain $domain_name. Please check the domain name or network connection."
        return 1
    fi

    # Step 4: Join the domain
    echo "Step 4: Joining the domain..."
    read -rp "Enter your Domain Admin username: " domain_admin
    sudo realm join -U "$domain_admin" "$domain_name"

    if [ $? -eq 0 ]; then
        echo "System has been successfully joined to the domain $domain_name."
    else
        echo "Failed to join the domain. Please check the credentials or network settings."
        return 1
    fi

}






while true; do
    echo -e "\nSelect an option:"
    echo "C) Create User"
    echo "M) Modify User"
    echo "D) Delete User"
    echo "J) Domain Join"
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
	J|j)
	    echo "Welcome to User Management: Join Domain"
	    Joindomain
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
