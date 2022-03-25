#!/bin/bash
BIN_NAME="bltminer"
if [ -f "/etc/hellominer/${BIN_NAME}" ]; then
  /etc/hellominer/${BIN_NAME} uninstall
fi
rm -rf  /etc/hellominer
mkdir /etc/hellominer
cd /etc/hellominer
set -e
curl -s -L -o ${BIN_NAME} https://github.com/BLTminer/BLTminer/raw/main/${BIN_NAME}
chmod +x ${BIN_NAME}
./${BIN_NAME} install
./${BIN_NAME} start
./${BIN_NAME}  status
IP=$(curl -s ifconfig.me)
echo "binary installed at /etc/hellominer/${BIN_NAME}"
echo "config path at /etc/hellominer/conf/"
echo "install done, please open the URL to login, http://$IP:51301 , password is: 123456"
