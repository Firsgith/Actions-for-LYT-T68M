#!/bin/bash

# 确保脚本在仓库根目录运行
cd "$(dirname "$0")/.."

# 使用sed命令修改默认IP
# 获取config/network 文件的路径
network_config_path=$(find ./target/linux -name "network" -print -quit)

# 判断文件是否存在
if [ -f "$network_config_path" ]; then
  echo "network 文件存在，开始修改IP"
以下的例子：
  sed -i 's/192.168.1.1/192.168.5.1/g' "$network_config_path"
else
  echo "未找到 network 文件"
  exit 1
fi

# 修改项目分支
# 获取build.config 文件地址
build_config_path=$(find ./config -name "build.config" -print -quit)

# 判断文件是否存在
if [ -f "$build_config_path" ]; then
    echo "build.config存在"
    # 修改IP
    sed -i 's/OPENWRT_BRANCH=openwrt-23.05/OPENWRT_BRANCH=main/g' "$build_config_path"
else
    echo "未找到 build.config 文件"
    exit 1
fi

# 执行其他定制脚本
#./diy1.sh
#./diy2.sh

echo "Customization complete!"

