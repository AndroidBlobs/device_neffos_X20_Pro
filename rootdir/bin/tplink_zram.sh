#!/system/bin/sh

totalmemory=$(cat /proc/meminfo | grep "MemTotal" | awk -F ':' '{print $2}'| awk '{print $1}')
cpunum=$(grep 'processor' /proc/cpuinfo | sort | uniq | wc -l)

if [ 0 -eq $1 ];then
    if [ $totalmemory -le 2097152 ]; then
        echo "lzo" > /sys/block/zram0/comp_algorithm
    else
        echo "lz4" > /sys/block/zram0/comp_algorithm
    fi
else
    if [ $totalmemory -le 2097152 ]; then
        echo 100 > /proc/sys/vm/swappiness
        echo 100 > /dev/memcg/memory.swappiness
        echo 100 > /dev/memcg/apps/memory.swappiness
        echo 100 > /dev/memcg/system/memory.swappiness
        echo 1 > /sys/block/zram0/max_comp_streams
    else
        echo 60 > /proc/sys/vm/swappiness
        echo 60 > /dev/memcg/memory.swappiness
        echo 60 > /dev/memcg/apps/memory.swappiness
        echo 60 > /dev/memcg/system/memory.swappiness
        echo $cpunum > /sys/block/zram0/max_comp_streams
    fi
fi
