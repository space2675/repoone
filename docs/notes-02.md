# notes-02

### mysql

- https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql


    mysql> create database if not exists wordpress character set utf8 collate utf8_general_ci;
    mysql> grant all privileges on wordpress.* to wp@localhost identified by 'wp';

- How to handle reconnect error?


    (SqlExceptionHelper.java:147) - The last packet successfully received from the server was 429,605,966 milliseconds ago.  The last packet sent successfully to the server was 429,605,966 milliseconds ago. is longer than the server configured value of 'wait_timeout'. You should consider either expiring and/or testing connection validity before use in your application, increasing the server configured values for client timeouts, or using the Connector/J connection property 'autoReconnect=true' to avoid this problem.
    
    #autoReconnect=true has no impact now
    #jdbc.url=jdbc:mysql://localhost:3306/dbinstance?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&autoReconnect=true
    jdbc.url=jdbc:mysql://localhost:3306/dbinstance?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8

### hadoop

- jdk-11-open
- openssh,  openssh-server
    - sudo apt-get update; sudo apt-get install openssh-server;
    - sudo systemctl status sshd
    - netstat -tulpn | grep 22
- https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#Pseudo-Distributed_Operation

### hive



