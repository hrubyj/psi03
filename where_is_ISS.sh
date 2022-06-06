#!/bin/sh
set -e

iss_data=$(http 'api.open-notify.org/iss-now.json')

iss_lat=$(echo "$iss_data" | jq -r '.iss_position.latitude')
iss_lng=$(echo "$iss_data" | jq -r '.iss_position.longitude')
sun_data=$(http 'api.sunrise-sunset.org/json' lat==$iss_lat lng==$iss_lng formatted==0)

sunrise_timedate=$(echo "$sun_data" | jq -r '.results.sunrise')
sunset_timedate=$(echo "$sun_data" | jq -r '.results.sunset')

sunset=$(date -d "$sunset_timedate" '+%s')
sunrise=$(date -d "$sunrise_timedate" '+%s')
now=$(date '+%s')

# Observation conditions are ideal 2 hours before sunrise or 2 hours after sunset
if [ $now -lt $sunrise ] && [ $now -gt $((sunrise - 7200)) ] \
|| [ $now -gt $sunset ] && [ $now -lt $((sunset + 7200)) ]
then
	conditions="ideal"
else
	conditions="NOT ideal"
fi

# Now between sunrise & sunset -> ISS on illuminated side
if [ $now -gt $sunrise ] && [ $now -lt $sunset ]
then
	side="illuminated"
else
	side="unilluminated"
fi

echo "The ISS is on the ${side} side of the Earth"
echo "Conditions for observing the ISS from the Earth are ${conditions}"