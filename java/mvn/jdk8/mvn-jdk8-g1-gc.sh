#!/bin/bash

source /Users/enesusta/.sdkman/bin/sdkman-init.sh

JAVA_8_JVMS=(
    "
    8.332.08.1-amzn
    8.0.332-librca
    8.0.332-sem
    8.0.332-tem
    8.0.332-zulu
    "
)

JAVA_TOOL_OPTIONS="-XX:+UseG1GC -XX:+PrintCommandLineFlags -XX:+PrintGC -XX:+PrintGCDetails"
MAVEN_OPTS="$JAVA_TOOL_OPTIONS"

cd ..
cd ..
cd playground

# echo "JVM", "Build Time" > req.csv

function timestamp {
  echo `python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")'` 
}

function diff {
  echo "$2-$1-$MeasuringCost" | bc
}

for JVM in ${JAVA_8_JVMS[@]}
do
    sdk use java ${JVM}
    start=`timestamp`
    mvn package -Djava.version=1.8 -DskipTests=true
    end=`timestamp`
    elapsed=`echo $end-$start | bc`
    echo "$JVM-g1-gc", $elapsed >> req.csv
done