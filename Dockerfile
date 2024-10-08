
FROM apache/spark:3.5.3-scala2.12-java17-python3-r-ubuntu
USER root
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

ARG MAVEN_REPO=https://repo1.maven.org/maven2
ARG SPARK_VERSION=3.5
ARG SCALA_VERSION=2.12
ARG ICEBERG_VERSION=1.6.1
ARG DELTA_VERSION=3.2.1
# Install wget
RUN apt-get update && apt-get install -y wget

RUN wget $MAVEN_REPO/org/apache/iceberg/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION/$ICEBERG_VERSION/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION-$ICEBERG_VERSION.jar \
    -O $SPARK_HOME/jars/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION-$ICEBERG_VERSION.jar

#RUN wget $MAVEN_REPO/io/delta/delta-spark_$SCALA_VERSION/$DELTA_VERSION/delta-spark_$SCALA_VERSION-$DELTA_VERSION.jar \
#    -O $SPARK_HOME/jars/delta-spark_$SCALA_VERSION-$DELTA_VERSION.jar