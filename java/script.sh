 # JAVA_OPTS=-server -Xmx3g -Xms1g -Dlog4j2.formatMsgNoLookups=true
#!/bin/bash

da=`date "+%Y_%m_%d_%H_%M_%S"`
killed=no
sig() {
echo "send signal $1 to pid $child"
kill -$1 "$child"
killed=yes
}

for sig in TERM INT; do
trap "sig $sig" $sig
done

forever(){
while [ $killed != yes ]; do
"$@" &
child=$!
echo child=$child
wait
done
}

export JAVA_OPTS

if [ $ENABLE_JMX == "yes" ]; then
java $JAVA_OPTS \
-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=10080 \
-XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=16M -XX:-OmitStackTraceInFastThrow \
-XX:GCLogFileSize=100M -Xloggc:/tmp/gc$da.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails \
-XX:InitiatingHeapOccupancyPercent=35 -XX:ConcGCThreads=12 -XX:ParallelGCThreads=30 -XX:+AlwaysPreTouch \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-Djava.security.egd=file:/dev/./urandom  -jar $WORK_DIR/api.jar
else
java $JAVA_OPTS  -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=10080 \
-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:G1HeapRegionSize=8M -XX:+PrintTenuringDistribution -XX:+PrintGCDateStamps -Xloggc:/tmp/gc$da.log \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-Djava.security.egd=file:/dev/./urandom  -jar $WORK_DIR/api.jar
fi