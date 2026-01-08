#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
    echo "error:: plese run this script with root privelege"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is FAILURE"
    else
        echo "Installing $2 is SUCCESS"
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "NGINX"