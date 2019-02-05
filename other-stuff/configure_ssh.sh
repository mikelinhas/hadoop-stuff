#!/bin/bash  

ssh-keygen -t rsa -P ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/aurthorized_keys


apt-get install openssh-server -y  
/etc/init.d/ssh status  
/etc/init.d/ssh start  

ssh-keyscan -H localhost > ~/.ssh/known_hosts  
yes | ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub > ~/.ssh/authorized_keys  
# TODO: Should I connect to localhost? 
# VERY IMPORTANT... this script does not work .... 

