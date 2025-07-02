#!/bin/sh
if [[ $1 == *""* ]]; then
  TARGET=$(echo "$1" | cut -d "(" -f2 | cut -d ")" -f1) 
  $(nmcli connection up "$TARGET")
elif [[ $1 == *""* ]]; then
  NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE connection show --active | grep wireguard | column -tH 1)
  $(nmcli connection down "$NMCLI_OUTPUT")
elif [[ -n "$1" ]]; then
  NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE connection show --active | grep wireguard | column -tH 1)
  if [[ -n "$NMCLI_OUTPUT" ]]; then
    $(nmcli connection down "$NMCLI_OUTPUT")
  fi
  $(nmcli connection up "$1")
fi
