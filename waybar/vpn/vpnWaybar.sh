#!/bin/sh
NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE connection show --active | grep wireguard | column -tH 1)

OUTPUT="󰅛"
TOOLTIP="No Wireguard Connection!"
CLASS="disconnected"

if [[ -n "$NMCLI_OUTPUT" ]]; then
  OUTPUT="󰱓"
  TOOLTIP="$NMCLI_OUTPUT"
  CLASS="connected"
  if [[ $(curl -s https://am.i.mullvad.net/connected) == *"not"* ]]; then
    OUTPUT="󰅛"
    TOOLTIP="Connection Failed!"
    CLASS="failed"
  fi
fi
printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$OUTPUT" "$TOOLTIP" "$CLASS"
