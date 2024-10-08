
FROM apache/spark:3.5.3-scala2.12-java17-python3-r-ubuntu
USER root
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

ARG MAVEN_REPO=https://repo1.maven.org/maven2
ARG SPARK_VERSION=3.5
ARG SCALA_VERSION=2.12
ARG ICEBERG_VERSION=1.6.1
ARG DELTA_VERSION=3.2.1

RUN apt-get update && apt-get install -y wget

# Installer Iceberg runtime for Spark, som bruker både i shell eller i et python-prosjekt. 
RUN wget $MAVEN_REPO/org/apache/iceberg/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION/$ICEBERG_VERSION/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION-$ICEBERG_VERSION.jar \
    -O $SPARK_HOME/jars/iceberg-spark-runtime-${SPARK_VERSION}_$SCALA_VERSION-$ICEBERG_VERSION.jar
