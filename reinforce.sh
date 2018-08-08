#!/usr/bin/env bash
# 自定义打印函数，-e支持输出转义字符，$@所有参数
print(){
    echo -e "\n\n----->"$@
}

print '【初始化】'
## 常量配置开始 ##
# 用户名、密码
user_name="lxy@janesi.com"
password="Janesi12345678"

# keystore
keystore_path="/usr/renqi/android_release_key_js.jks"
keystore_password="jiansi123"
keystore_alias="janesi"
keystore_alias_password="jiansi123"

buildDir=$1
app_dir=${buildDir}

# 输入/输出apk
base_apk="${app_dir}/outputs/apk/release/app_release_tt_.apk"

# 输出目录
output_apk_dir="${app_dir}/outputs/apk/release/rein"
output_apk="${output_apk_dir}/app_release_tt_jiagu_sign.apk"


print "【待加固apk】${base_apk}"

# 增强服务
enhancement_service=${7:-''} # 若未向脚本提供该参数，则默认为空字符串''

# 加固保根目录
#jiagubao_dir="/usr/renqi/360jiagubao_linux_64_1536/jiagu/" # 目录包含末尾斜线

jiagubao_dir="D:/临时文件/新建文件夹/360jiagubao_linux_64_1536/jiagu/"

## 常量配置结束 ##

cd $jiagubao_dir

print "【进入目录】 $PWD"

# 1. 登录
print "【登录】"
java/bin/java -jar jiagu.jar -login $user_name $password
# 2. 导入keystore信息
print "【导入keystore信息】"
java/bin/java -jar jiagu.jar -importsign $keystore_path $keystore_password $keystore_alias $keystore_alias_password
# 3. 配置增加服务，若不需要则跳过
if [ "$enhancement_service" != '' ]
then
    print "【配置增强服务】"
    java/bin/java -jar jiagu.jar -config $enhancement_service
fi
# 4. 加固
print "【加固】"
java/bin/java -jar jiagu.jar -jiagu $base_apk $output_apk_dir -autosign
# 5. 输出结果
print "【加固完成apk】${output_apk}"
exit