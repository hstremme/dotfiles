#!/bin/sh
if [[ $1 == *""* ]]; then
  TARGET=$(echo "$1" | cut -d "(" -f2 | cut -d ")" -f1) 
  $(nmcli connection up "$TARGET")
elif [[ $1 == *""* ]]; then
  NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE,NAME connection show --active | grep -w -e wireguard -e vpn | column -tH 1,2)
  $(nmcli connection down "$NMCLI_OUTPUT")
elif [[ -n "$1" ]]; then
  NMCLI_OUTPUT=$(nmcli -f TYPE,DEVICE,NAME connection show --active | grep -w -e wireguard -e vpn | column -tH 1,2)
  if [[ -n "$NMCLI_OUTPUT" ]]; then
    $(nmcli connection down "$NMCLI_OUTPUT")
  fi
  # OpenConnect needs Credentials
  if [[ "$1" == *"VPN"* ]]; then
    $(alacritty -e bash -c "nmcli c up '$1' --ask && printf "\nSetting VPN MTU to 1000\n" && sudo ip link set mtu 1000 vpn0")
  else
    $(nmcli connection up "$1")
  fi
fi
