#!/usr/bin/env bash

#zip channle.zip ${WORKSPACE}/app/build/outputs/apk/release/channel/*
#这样使用会将zip包打包到workspace的根目录

#压缩渠道包
if [ ${CHANNEL} == 'All' ]
then
	echo "多渠道：${CHANNEL}"
    cd ${WORKSPACE}/app/build/outputs/apk/release/ && zip channle.zip  channel/*
else
	echo "单渠道：${CHANNEL}"
fi
