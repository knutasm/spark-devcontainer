### Filstier
- jars: $SPARK_HOME/jars (eks `ls $SPARK_HOME/jars | grep iceberg`)
- Spark Connect: `$SPARK_HOME/sbin/spark-connect-server.sh --packages org.apache.spark:spark-connect_2.12:3.5.3`

### pythonpakker
- pyspark
- pyspark[connect]==3.5.3
- delta-spark
- pandas
- pyarrow
- grpcio
- grpcio-status
