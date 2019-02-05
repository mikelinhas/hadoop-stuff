#!/bin/bash  

# Script to install Sun Java and Hadoop 2.6 

clear  

echo "Bash Script for Updating Hadoop!"  

echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/core-site.xml"
echo "Note: using '/app/hadoop/tmp' as directory"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml 


echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/mapred-site.xml"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml


echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/hdfs-site.xml"
echo "Note: using '~/home/hduser/hdfs' for HDFS"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml

echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/yarn-site.xml"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/slaves"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/slaves /usr/local/hadoop/etc/hadoop/slaves

echo ""
echo "Changing ownership of all new files"
chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop


echo ""
echo "Completed process..." 
echo "" 
cd ~  




