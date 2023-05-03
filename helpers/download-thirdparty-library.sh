#!/bin/bash
set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

# 使用代理下载源码
#  bash download-thirdparty-library.sh --proxy http://192.168.3.26:8015

PROXY_URL=''
while [ $# -gt 0 ]; do
  case "$1" in
  --proxy)
    PROXY_URL="$2"
    shift
    ;;
  --*)
    echo "Illegal option $1"
    ;;
  esac
  shift $(($# > 0 ? 1 : 0))
done

if [ -n $PROXY_URL ] ; then
  export http_proxy=$PROXY_URL
  export https_proxy=$PROXY_URL
fi

curl -Lo opencv.js https://docs.opencv.org/5.x/opencv.js

git clone -b main https://github.com/jingjingxyk/frontend-utils.git  --depth=1 --progress
