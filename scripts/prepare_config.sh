#!/bin/bash

# 确保脚本在仓库根目录运行
cd "$(dirname "$0")/.."

# 更新和配置feeds
echo "Updating feeds..."
./scripts/feeds update -a
./scripts/feeds install -a

# 添加 feeds.conf.default
echo "Create feeds.conf.default..."
cat > feeds.conf.default <<EOF
src-git packages https://github.com/immortalwrt/packages
src-git luci https://github.com/immortalwrt/luci
src-git routing https://github.com/immortalwrt/routing
src-git telephony https://github.com/immortalwrt/telephony
EOF

# 将仓库目录的config文件拷贝到openwrt根目录
cp config/.config .config

# 生成 .config (使用你的配置文件)
echo "Configuring..."
make defconfig

echo "Prepare complete!"

