#!/bin/sh
FIRST_ENTRY="<span color=\"#EBBCBA\"> Default Connection ($1)</span>"

NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE,NAME connection show --active | grep -w -e wireguard -e vpn | column -tH 1,2)
if [[ -n "$NMCLI_OUTPUT" ]]; then
  FIRST_ENTRY="<span color=\"#EBBCBA\"> Disconnect ($(echo $NMCLI_OUTPUT))</span>"
fi

ENTRIES=$(nmcli -f TYPE,NAME,DEVICE connection show | grep -w -e wireguard -e vpn | column -t -H 1,3)
printf "$FIRST_ENTRY\n$ENTRIES"
