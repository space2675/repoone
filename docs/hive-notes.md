# hive-notes

- Add the following in .bash_aliases


    export HADOOP_HOME=/opt/hadoop-3.3.4
    export HIVE_HOME=/opt/apache-hive-3.1.3-bin
    export PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin


- https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql


    mysql> create database hive_metastore;
    mysql> CREATE USER 'hive'@'localhost' IDENTIFIED BY 'hive';
    mysql> GRANT CREATE, INDEX, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'hive'@'localhost' WITH GRANT OPTION;


- https://kontext.tech/article/561/apache-hive-312-installation-on-linux-guide


To avoid guava lib issues like:
Exception in thread "main" java.lang.NoSuchMethodError: com.google.common.base.Preconditions.checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V, let's ensure guava library version is consistent between Hive and Hadoop.

    $ ls $HADOOP_HOME/share/hadoop/common/lib | grep guava
    guava-27.0-jre.jar

    $ ls $HIVE_HOME/lib | grep guava
    guava-19.0.jar
    jersey-guava-2.25.1.jar

    Copy newer version from Hadoop to Hive:
    rm $HIVE_HOME/lib/guava-19.0.jar
    cp $HADOOP_HOME/share/hadoop/common/lib/guava-27.0-jre.jar $HIVE_HOME/lib/


- initialize the metastore
  - $ bin/schematool -dbType mysql -initSchema

- start hiveserver2


    $HIVE_HOME/bin/hive --service metastore &
    $HIVE_HOME/bin/hive --service hiveserver2 &

# Problem #1:
http://localhost:10002/  does not open


- start beeline

# Problem #2:
$HIVE_HOME/bin/beeline -u jdbc:hive2://localhost:10000

