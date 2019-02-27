#!/usr/bin/env bash
if [ -f "/app.jar" ]; then
    if [ -f "/sys/fs/cgroup/memory/memory.limit_in_bytes" ]; then
        MEMORY_BYTES=`cat /sys/fs/cgroup/memory/memory.limit_in_bytes`
        echo "limits bytes is $MEMORY_BYTES!"
    else
        echo "limits bytes not found, set memory to default 1Gi!"
        MEMORY_BYTES=1073741824 # 1Gi !!!should get bytes from proc/meminfo!!!
    fi
    ENN_JVM_XMX=$((MEMORY_BYTES*5/10/1024/1024))m # 0.5 of MEMORY_BYTES
    ENN_JVM_XMS=$((MEMORY_BYTES*5/10/1024/1024))m # 0.5 of MEMORY_BYTES
    ENN_JVM_MMS=$((MEMORY_BYTES*2/10/1024/1024))m # 0.2 of MEMORY_BYTES

    if [ ${JVM_MAX_HEAP} ]; then
        echo "JVM_MAX_HEAP found, set -Xmx$JVM_MAX_HEAP"
        ENN_JVM_XMX=${JVM_MAX_HEAP}
    fi

    if [ ${JVM_XMX} ]; then
        echo "JVM_XMX found, set -Xmx$JVM_XMX"
        ENN_JVM_XMX=${JVM_XMX}
    fi

    if [ ${JVM_XMS} ]; then
        echo "JVM_XMS found, set -Xms$JVM_XMS"
        ENN_JVM_XMS=${JVM_XMS}
    fi

    if [ ${JVM_MMS} ]; then
        echo "JVM_MMS found, set -XX:MaxMetaspaceSize=$JVM_MMS"
        ENN_JVM_MMS=${JVM_MMS}
    fi

    echo "java -Djava.security.egd=file:/dev/.urandom -jar -Xms${ENN_JVM_XMS} -Xmx${ENN_JVM_XMX} -XX:MaxMetaspaceSize=${ENN_JVM_MMS} ${JAVA_OPTS} /app.jar"
    java -Dfile.encoding=UTF-8 -Djava.security.egd=file:/dev/.urandom -jar -Xms${ENN_JVM_XMS} -Xmx${ENN_JVM_XMX} -XX:MaxMetaspaceSize=${ENN_JVM_MMS} ${JAVA_OPTS} /app.jar
else
    echo "/app.jar not found!"
fi
