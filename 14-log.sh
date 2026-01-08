#!/bin/bash

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


LOG_FOLDER=/var/log/shell-script
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE=$LOG_FOLDER/$SCRIPT_NAME.log

mkdir -p $LOG_FOLDER
touch $LOGS_FILE

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is..$R FAILURE $N"
    else
        echo -e "Installing $2 is ..$G SUCCESS $N"
    fi
}

dnf list installed mysql &>> LOGS_FILE
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> LOGS_FILE
    VALIDATE $? "MySQL"
else
    echo  -e "MySQL already exist ... $Y skipping $N"
fi

dnf list installed nginx &>> LOGS_FILE
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> LOGS_FILE
    VALIDATE $? "NGINX"
else
    echo -e "NGINX already exist...$Y skipping $N"
fi

dnf list installed python3 &>> LOGS_FILE
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> LOGS_FILE
    VALIDATE $? "PYTHON"
else 
    echo -e "PYTHON3 already exists...$Y Skipping $N"
fi