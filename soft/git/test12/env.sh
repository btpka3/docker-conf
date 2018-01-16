#!/bin/bash

export APP=git

#
# 向控制台输出内容。消息前会追加时间戳。
#
# @param $1 要打印的消息
#
log(){
    #Cyan
    Color_ON='\033[0;36m'
    Color_Off='\033[0m'
    echo -e "${Color_ON}$(date +%Y-%m-%d.%H:%M:%S) : $1${Color_Off}" 1>&2
}



