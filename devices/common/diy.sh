#!/bin/bash
shopt -s extglob

sed -i '/telephony/d' feeds.conf.default

sed -i "s?targets/%S/packages;targets/%S/\$(LINUX_VERSION)?" include/feeds.mk
sed -i '/ refresh_config();/d' scripts/feeds

sed -i "s?git.openwrt.org/\(project\|feed\)?github.com/openwrt?" feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a
