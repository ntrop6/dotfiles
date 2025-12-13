#!/bin/bash

SERVICE_NAME="openvpn.service"
STATE="disconnected"
TOOLTIP_TEXT="Service is not running"

if systemctl is-active --quiet "$SERVICE_NAME"; then
  STATE="connected"
  TOOLTIP_TEXT="Service is running"
fi

echo "{\"alt\":\"${STATE}\",\"text\":\"${TOOLTIP_TEXT}\"}"
