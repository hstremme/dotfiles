#!/bin/sh

# CURL JSON from wttr.in for luebeck
JSON=$(curl -s wttr.in/luebeck?format=j1)

# Getting Values from JSON 
CURRENT_TEMP=$(echo "$JSON" | jq '.current_condition[0].temp_C | tonumber')
CURRENT_CODE=$(echo "$JSON" | jq '.current_condition[0].weatherCode | tonumber')
CURRENT_DESC=$(echo "$JSON" | jq -r '.current_condition[0].weatherDesc[0].value')
CURRENT_TEMP_FEEL=$(echo "$JSON" | jq '.current_condition[0].FeelsLikeC | tonumber')
CURRENT_WINDSPEED=$(echo "$JSON" | jq '.current_condition[0].windspeedKmph | tonumber')
CURRENT_WINDDIR=$(echo "$JSON" | jq -r '.current_condition[0].winddir16Point')

# Tranlating weather codes into symbols
code_to_symbol() {
  case $1 in

    113)
      echo "󰖙"
      ;;

    116)
      echo "󰖕"
      ;;

    119 | 122)
      echo "󰖐"
      ;;

    266 | 293 | 296 | 302 | 308 | 359)
      echo ""
      ;;

    *)
      echo $CURRENT_DESC
      ;;

  esac
}
CURRENT_SYMBOL=$(code_to_symbol "$CURRENT_CODE")

winddir_to_symbol() {
  case $1 in

    "N")
      echo ""
      ;;

    "NE" | "NNE" | "ENE")
      echo ""
      ;;

    "E")
      echo ""
      ;;

    "SE" | "ESE" | "SSE")
      echo ""
      ;;

    "S")
      echo ""
      ;;

    "SW" | "WSW" | "SSW")
      echo ""
      ;;

    "W")
      echo ""
      ;;

    "NW" | "WNW" | "NNW")
      echo ""
      ;;

    *)
      echo $CURRENT_WINDDIR
      ;;

  esac
}
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
