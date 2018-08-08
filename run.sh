#!/usr/bin/env bash
# 【加固相关】

set +x # 抑制输出脚本内容


shellDir="/usr/renqi/rein_shell"
buildDir=$1
build_type="Release"

if [ ${build_type} == 'Release' ]
then
    # 参数：keystore路径、keystore密码、keystore别名、keystore别名密码、待加固apk路径filter、加固后apk输出目录、增强服务
    bash +ex ${shellDir}/reinforce.sh $buildDir
else
    bash +ex ${shellDir}/reinforce.sh $buildDir
fi

