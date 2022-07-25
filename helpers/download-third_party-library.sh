#!/bin/bash
set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

export http_proxy=http://127.0.0.1:8015
export https_proxy=http://127.0.0.1:8015

curl -Lo opencv.js https://docs.opencv.org/5.x/opencv.js

git clone -b main https://github.com/jingjingxyk/frontend-utils.git  --depth=1 --progress
