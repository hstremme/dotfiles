#!/bin/sh

# CURL JSON from Bright Sky API for luebeck
JSON=$(curl -s https://api.brightsky.dev/current_weather?dwd_station_id=03086)

# Getting Values from JSON 
CURRENT_TEMP=$(echo "$JSON" | jq '.weather.temperature')
CURRENT_TEMP=$(printf '%.*f' 0 "$CURRENT_TEMP")
CURRENT_ICON_DESC=$(echo "$JSON" | jq -r '.weather.icon')
CURRENT_WINDSPEED=$(echo "$JSON" | jq '.weather.wind_speed_30')
CURRENT_WINDSPEED=$(printf '%.*f' 0 "$CURRENT_WINDSPEED")
CURRENT_GUSTSPEED=$(echo "$JSON" | jq '.weather.wind_gust_speed_30')
CURRENT_GUSTSPEED=$(printf '%.*f' 0 "$CURRENT_GUSTSPEED")
CURRENT_WINDDIR=$(echo "$JSON" | jq '.weather.wind_direction_30')

# Tranlating weather codes into symbols
code_to_symbol() {
  case $1 in

    "clear-day")
      echo "󰖙"
      ;;

    "clear-night")
      echo "󰖔"
      ;;

    "partly-cloudy-day")
      echo "󰖕"
      ;;

    "partly-cloudy-night")
      echo "󰼱"
      ;;

    "cloudy")
      echo "󰖐"
      ;;

    "fog")
      echo "󰖑"
      ;;

    "wind")
      echo "󰖝"
      ;;

    "rain")
      echo ""
      ;;

    "sleet")
      echo "󰙿"
      ;;

    "snow")
      echo "󰖘"
      ;;

    "snow")
      echo "󰖒"
      ;;

    "thunderstorm")
      echo "󰖓"
      ;;

    "null" | *)
      echo $CURRENT_ICON_DESC
      ;;

  esac
}
CURRENT_SYMBOL=$(code_to_symbol "$CURRENT_ICON_DESC")

winddir_to_symbol() {
  case $1 in

    8 | 0)
      echo "󰁅"
      ;;

    1)
      echo ""
      ;;

    2)
      echo "󰁍"
      ;;

    3)
      echo ""
      ;;

    4)
      echo "󰁝"
      ;;

    5)
      echo ""
      ;;

    6)
      echo "󰁔"
      ;;

    7)
      echo ""
      ;;

    *)
      echo $CURRENT_WINDDIR
      ;;

  esac
}
CURRENT_WINDDIR=$(printf '%.*f' 0 $(($CURRENT_WINDDIR/45)))
CURRENT_WINDDIR_SYMBOL=$(winddir_to_symbol "$CURRENT_WINDDIR")

# Setting output, adding wind symbol for WindKmph over 40
if [ $CURRENT_WINDSPEED -ge 40 ]; then 
  OUTPUT="$CURRENT_SYMBOL $CURRENT_TEMP° 󱗺"
else
  OUTPUT="$CURRENT_SYMBOL $CURRENT_TEMP°"
fi

# Setting tooltip output
OUTPUT_TOOLTIP="$CURRENT_DESC /  $CURRENT_TEMP_FEEL° / $CURRENT_WINDDIR_SYMBOL ${CURRENT_WINDSPEED}km/h"

printf '{"text": "%s", "tooltip": "%s"}' "$OUTPUT" "$OUTPUT_TOOLTIP"

#    "113": "Sunny",
#    "116": "PartlyCloudy",
#    "119": "Cloudy",
#    "122": "VeryCloudy",
#    "143": "Fog",
#    "176": "LightShowers",
#    "179": "LightSleetShowers",
#    "182": "LightSleet",
#    "185": "LightSleet",
#    "200": "ThunderyShowers",
#    "227": "LightSnow",
#    "230": "HeavySnow",
#    "248": "Fog",
#    "260": "Fog",
#    "263": "LightShowers",
#    "266": "LightRain",
#    "281": "LightSleet",
#    "284": "LightSleet",
#    "293": "LightRain",
#    "296": "LightRain",
#    "299": "HeavyShowers",
#    "302": "HeavyRain",
#    "305": "HeavyShowers",
#    "308": "HeavyRain",
#    "311": "LightSleet",
#    "314": "LightSleet",
#    "317": "LightSleet",
#    "320": "LightSnow",
#    "323": "LightSnowShowers",
#    "326": "LightSnowShowers",
#    "329": "HeavySnow",
#    "332": "HeavySnow",
#    "335": "HeavySnowShowers",
#    "338": "HeavySnow",
#    "350": "LightSleet",
#    "353": "LightShowers",
#    "356": "HeavyShowers",
#    "359": "HeavyRain",
#    "362": "LightSleetShowers",
#    "365": "LightSleetShowers",
#    "368": "LightSnowShowers",
#    "371": "HeavySnowShowers",
#    "374": "LightSleetShowers",
#    "377": "LightSleet",
#    "386": "ThunderyShowers",
#    "389": "ThunderyHeavyRain",
#    "392": "ThunderySnowShowers",
#    "395": "HeavySnowShowers",
