#!/bin/bash

REGION=`curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
echo $REGION

REGION_SIGN=${REGION:0:2}
echo $REGION_SIGN

REGION_SIGN=$(echo $REGION_SIGN | tr 'a-z' 'A-Z'| xargs)
echo $REGION_SIGN

FILENAME="user_ids_${REGION_SIGN}.csv"
echo $FILENAME

cp $FILENAME  user_ids.csv