#!/bin/bash

VPN_NAME="riseup-ovpn"
STATE="disconnected"
TOOLTIP_TEXT="Disconnected"

if nmcli -t -f NAME,TYPE con show --active | grep -q "^${VPN_NAME}:vpn$"; then
  STATE="connected"

  VPN_INTERFACE=$(nmcli -t -f DEVICE,TYPE con show --active | awk -F: '$2 == "vpn" {print $1}')

  if [[ -n "$VPN_INTERFACE" ]]; then
    CACHE_FILE="/tmp/vpn_geo_cache"
    CACHE_DURATION=60
    NOW=$(date +%s)

    if [[ -f "$CACHE_FILE" && $((NOW - $(stat -c %Y "$CACHE_FILE"))) -lt $CACHE_DURATION ]]; then
      GEO_INFO=$(<"$CACHE_FILE")
    else
      GEO_INFO=$(curl -s --interface "$VPN_INTERFACE" --connect-timeout 2 --max-time 2 https://ipinfo.io)

      if [[ -z "$GEO_INFO" ]]; then
        GEO_INFO=$(curl -s --connect-timeout 2 --max-time 2 https://ipinfo.io)
      fi

      echo "$GEO_INFO" > "$CACHE_FILE"
    fi

    PUBLIC_IP=$(echo "$GEO_INFO" | jq -r .ip)
    CITY=$(echo "$GEO_INFO" | jq -r .city)
    COUNTRY=$(echo "$GEO_INFO" | jq -r .country)

    if [[ -n "$PUBLIC_IP" && -n "$CITY" && -n "$COUNTRY" ]]; then
      TOOLTIP_TEXT="Connected to $CITY, $COUNTRY [$PUBLIC_IP]"
    elif [[ -n "$PUBLIC_IP" ]]; then
      TOOLTIP_TEXT="Connected [$PUBLIC_IP]"
    else
      TOOLTIP_TEXT="Connected"
    fi
  else
    TOOLTIP_TEXT="Connected"
  fi
fi

echo "{\"alt\":\"${STATE}\",\"text\":\"${TOOLTIP_TEXT}\"}"
