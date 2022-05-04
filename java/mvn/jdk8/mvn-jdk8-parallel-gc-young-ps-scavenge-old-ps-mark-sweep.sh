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

JAVA_TOOL_OPTIONS="-XX:+UseParallelGC -XX:+UseParallelOldGC -XX:-UseAdaptiveSizePolicy -XX:+PrintCommandLineFlags -XX:+PrintGC -XX:+PrintGCDetails"

for JVM in ${JAVA_8_JVMS[@]}
do
    sdk use java ${JVM}
    java $JAVA_TOOL_OPTIONS -version
done
