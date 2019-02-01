#!/bin/bash  

# Script to install Sun Java and Hadoop 2.6 

clear  

# This command is used to tell shell, turn installation mode to non interactive  
# and set auto selection of agreement for Sun Java  
export DEBIAN_FRONTEND=noninteractive  
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections  
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections  


echo "Bash Script for Installing Sun Java for Ubuntu!"  

echo ""
echo ""
echo "Now Script will try to purge OpenJdk if installed..."
purge openjdk if installed to remove conflict  
apt-get purge openjdk-\* -y  


echo ""
echo "Now we will update repository..."
apt-get update -y  


echo ""
echo "Adding Java Repository...."

apt-get install python-software-properties -y  
add-apt-repository ppa:webupd8team/java -y  


echo ""
echo "Updating Repository to load java repository"
apt-get update -y  

echo ""
echo "Installing Sun Java....."  
sudo -E apt-get purge oracle-java8-installer -y  
sudo -E apt-get install oracle-java8-installer -y  

echo ""
echo "Installation completed...."
echo ""  

echo ""
echo "Installed java version is...."  

java -version  


apt-get install openssh-server -y  
/etc/init.d/ssh status  
/etc/init.d/ssh start  

ssh-keyscan -H localhost > ~/.ssh/known_hosts  
yes | ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub > ~/.ssh/authorized_keys  
# TODO: Should I connect to localhost?  


echo ""
echo "Download and extract HADOOP"
cd /usr/local  
sudo wget http://apache.rediris.es/hadoop/core/hadoop-2.9.0/hadoop-2.9.0.tar.gz
tar xzf hadoop-2.9.0.tar.gz  
mkdir hadoop  
mv hadoop-2.9.0/* hadoop/
chown -R hduser:hadoop hadoop
rm -R hadoop-2.9.0  


echo ""
echo "Now script is updating Bashrc for export Path etc"  

cat >> ~/.bashrc <<EOF 
export HADOOP_HOME=/usr/local/hadoop  
export HADOOP_MAPRED_HOME=/usr/local/hadoop  
export HADOOP_COMMON_HOME=/usr/local/hadoop  
export HADOOP_HDFS_HOME=/usr/local/hadoop  
export YARN_HOME=/usr/local/hadoop  
export HADOOP_COMMON_LIB_NATIVE_DIR=/usr/local/hadoop/lib/native  
export JAVA_HOME=/usr/  
export PATH=$PATH:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:$JAVA_PATH/bin  
EOF

source ~/.bashrc 

echo ""
echo "Copying my version of $HADOOP_HOME/etc/hadoop/core-site.xml"
echo "Note: using '/app/hadoop/tmp' as directory"
cp /home/zarco/hadoop-stuff/hadoop-conf-files/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml 

echo ""
echo "Making directory '/app/hadoop/tmp'"
cd /usr/local/hadoop/etc/hadoop
mkdir -p /app/hadoop/tmp
chown -R hduser:hadoop /app/hadoop/tmp
chmod 750 /app/hadoop/tmp


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
echo "Changing ownership of all new files"
chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop

echo ""
echo "Creating '/home/hduser' folder"

cd /home/hduser
mkdir data
cd data
mkdir nameNode
mkdir dataNode
chown -R hduser:hadoop /home/hduser/data
chmod 750 /home/hduser/data


echo ""
echo "Completed process..." 
echo "" 
cd ~  

echo "You may require reloading bash profile, you can reload using following command."  
echo "source ~/.bashrc"  

echo "To Start you need to format Name Node Once you can use following command."  
echo "hdfs namenode -format"  

echo ""
echo "After that, you can start hadoop using following commands. "  
echo "start-dfs.sh"  
echo "start-yarn.sh"  

echo ""
echo "Use the 'jps' tool to check if it is running"

echo ""
echo "To stop hadoop use following scripts."  
echo "stop-dfs.sh"  
echo "stop-yarn.sh"  

echo "" 
echo "Note: Cluster is not configured yet. Must change '/etc/hosts' and '/hadoop/slaves'"
echo "" 

echo "DON'T FORGET TO ADD JAVA PATH MANUALLY TO '$HADOOP_HOME/etc/hadoop/hadoop-env.sh'"



