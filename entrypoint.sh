#!/bin/sh
set -e
# Railway 注入 $PORT，Xray 内部用明文 WS，TLS 由 Railway 边缘在 443 终结
PORT=${PORT:-8080}
sed -i "s/8080/$PORT/g; s/UUID_PLACEHOLDER/${XRAY_UUID}/g; s|WS_PATH_PLACEHOLDER|${WS_PATH}|g" /etc/xray/config.json
exec /usr/local/bin/xray -c /etc/xray/config.json
