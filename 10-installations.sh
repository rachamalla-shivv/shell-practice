#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
    echo "error:: plese run this script with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql is failure"
else
    echo "mysql is installed successfully"