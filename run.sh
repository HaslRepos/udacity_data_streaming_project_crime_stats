/usr/bin/zookeeper-server-start config/zookeeper.properties
/usr/bin/kafka-server-start config/server.properties

kafka-topics --zookeeper localhost:2181 --create --topic org.udacity.crime.stats.calls --replication-factor 1 --partitions 2
kafka-topics --zookeeper localhost:2181 --delete --topic org.udacity.crime.stats.calls
kafka-topics --zookeeper localhost:2181 --list

python kafka_server.py

/usr/bin/kafka-console-consumer --topic "org.udacity.crime.stats.calls" --from-beginning --bootstrap-server localhost:9092 

spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.4 --master local[*] data_stream.py
