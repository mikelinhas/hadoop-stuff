# hadoop-stuff
### Hadoop installation and configuration

Information from

https://www.linode.com/docs/databases/hadoop/how-to-install-and-set-up-hadoop-cluster/


## Remember to
**Set /etc/hosts (on all nodes?)**
box.1.ip.addr    node-master
box.2.ip.addr    node1
box.3.ip.addr    node2


**Generate ssh-key for all nodes and distribute**
ssh-keygen -b 4096

ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@node-master
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@node1
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@node2


**Create hduser:hadoop on all nodes**

Edit ~/hadoop/etc/hadoop/slaves to be:
node1
node2


To Start you need to format Name Node Once you can use following command.
hdfs namenode -format


After that, you can start hadoop using following commands.
start-dfs.sh
start-yarn.sh

This starts NameNode and SecondaryNameNode on node-master and DataNode on node1 and node2.
Checkout http://node-master-IP:50070


Use the 'jps' tool to check if it is running


To stop hadoop use following scripts.
stop-dfs.sh
stop-yarn.sh

DON'T FORGET TO ADD JAVA PATH MANUALLY TO '$HADOOP_HOME/etc/hadoop/hadoop-env.sh'


