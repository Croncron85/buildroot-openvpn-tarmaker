#!/bin/bash

# lets be cautious
if [ "$TARGET_DIR" = "" ]; then
  echo "POST: TARGET_DIR not set"
  exit 1
fi

rm $TARGET_DIR/etc/resolv.conf $TARGET_DIR/sbin/init
touch $TARGET_DIR/etc/resolv.conf $TARGET_DIR/sbin/init

cp docker/openvpn/init.sh $TARGET_DIR/init.sh
chmod 750 $TARGET_DIR/init.sh
