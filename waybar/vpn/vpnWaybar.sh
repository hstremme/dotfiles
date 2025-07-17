#!/bin/sh
NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE connection show --active | grep -w -e wireguard -e vpn | column -tH 2)

OUTPUT="󰅛"
TOOLTIP="No Wireguard Connection!"
CLASS="disconnected"

if [[ "$NMCLI_OUTPUT" = "wireguard" ]]; then
  OUTPUT="󰱓"
  TOOLTIP="$NMCLI_OUTPUT"
  CLASS="connected"
  if [[ $(curl -s https://am.i.mullvad.net/connected) == *"not"* ]]; then
    OUTPUT="󰅛"
    TOOLTIP="Connection Failed!"
    CLASS="failed"
  fi
elif [[ "$NMCLI_OUTPUT" = "vpn" ]]; then
  OUTPUT="󰑴"
  TOOLTIP="$NMCLI_OUTPUT"
  CLASS="connected-uni"
fi

printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$OUTPUT" "$TOOLTIP" "$CLASS"
