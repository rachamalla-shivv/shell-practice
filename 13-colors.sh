#!/bin/bash

#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
    echo "error:: plese run this script with root privelege"
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is..$R FAILURE $N"
    else
        echo -e "Installing $2 is ..$G SUCCESS $N"
    fi
}

dnf list installed mysql
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL already exist ... $Y skipping $N"
fi

dnf list installed nginx
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo "NGINX already exist...$Y skipping $N"
fi

dnf list installed python3
# install if it is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON"
else 
    echo "PYTHON3 already exists...$Y Skipping $N"
fi