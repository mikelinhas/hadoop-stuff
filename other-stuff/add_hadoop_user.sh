#!/bin/bash  

# Script to add hadoop user and group 

sudo addgroup hadoop
echo "'hadoop' group added"

sudo adduser --ingroup hadoop hduser
echo "'hduser' user added"

sudo adduser hduser sudo

echo "Logging in as 'hduser'..."
su hduser
