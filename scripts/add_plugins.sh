#!/bin/bash

# 确保脚本在仓库根目录运行
cd "$(dirname "$0")/.."

# 读取插件列表文件
while read -r plugin_url; do
  if [[ -n "$plugin_url" ]]; then
    echo "Adding plugin from: $plugin_url"
    ./scripts/feeds update luci
    ./scripts/feeds install -p luci $(basename "$plugin_url" .git)
  fi
done < config/plugins.list

echo "Plugins added.  You may need to run make menuconfig to select them."

