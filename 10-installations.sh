#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
    echo "error:: plese run this script with root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql is failure"
    exit 1
else
    echo "mysql is installed successfully"