#!/bin/bash

DIR_NAME=$1
START_NUM=$2
END_NUM=$3

for (( i=$START_NUM; i<=$END_NUM; i++ ))
do mkdir ${DIR_NAME}${i}
	echo "Folder is created ${DIR_NAME}${i}"
done
#
echo "All folder has been created successfully"
