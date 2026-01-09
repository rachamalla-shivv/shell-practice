#!/bin/bash


USERID=$( id -u )

echo "Script started executed at: $(date) "
if [ $USERID -ne 0 ]; then
    echo "error:: plese run this script with root privelege"
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is..$R FAILURE $N"
    else
        echo -e "Installing $2 is ..$G SUCCESS $N"
    fi
}

for package in $@
do 
    #check package is already installed or nnot
    dnf list installed $package &>>$LOGS_FILE
    
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package alredy installed...$Y SkIPPING $N"
    fi
done