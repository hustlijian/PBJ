#!/bin/bash
#script that executes testPBJ.sh on every lab machine (to start dummy nodes)

if [ -z "$1" ]; then
 echo "Please supply username."
 exit
fi

USER=$1
MACHINECOUNT=0
machines=( )

#24 dragons
COUNTER=1
while [  $COUNTER -lt 25 ]; do
 machines[$MACHINECOUNT]=dragon$COUNTER
 let COUNTER=COUNTER+1
 let MACHINECOUNT=MACHINECOUNT+1
done

#27 frogs
COUNTER=1
while [  $COUNTER -lt 28 ]; do
 machines[$MACHINECOUNT]=frog$COUNTER
 let COUNTER=COUNTER+1 
 let MACHINECOUNT=MACHINECOUNT+1
done

#22 geckos, but use gecko 22 as gateway, 21 as demo
COUNTER=1
while [  $COUNTER -lt 21 ]; do
 machines[$MACHINECOUNT]=gecko$COUNTER
 let COUNTER=COUNTER+1 
 let MACHINECOUNT=MACHINECOUNT+1
done

for machine in "${machines[@]}";
do
 ssh -o "StrictHostKeyChecking no" -o "ConnectTimeout=2" $USER@$machine.cs.clemson.edu "cd PBJ ; nohup ./testPBJ.sh $machine && exit" &
 sleep 0.5
done
