# aws-notes

S3 or HDFS / Hadoop?

http://blog.mortardata.com/post/58920122308/s3-hadoop-performance

- Tip #1: Organize Your S3 Bucket for Speed
- Tip #2: Store fewer, larger files instead of many smaller ones
- Tip #3: Compress your data, or don’t
- Tip #4: Avoid Underscores in Bucket Names
- Tip #5: Stream Data Directly to S3 with EMR

        EMR clusters have a special version of the S3 File System that 
        can stream data directly to S3 instead of buffering to intermediate local files.

- Tip #6: Partition-Aware S3 Keys

How is the data transferred with S3 as external data storage for Hadoop/hive?

https://stackoverflow.com/questions/13624665/when-you-create-an-external-table-in-hive-with-an-s3-location-is-the-data-transf
