#!/bin/bash

# Get the current application id
APPNAME="supervisortest"
APPID=$(curl --header "Content-Type:application/json" "$RESIN_SUPERVISOR_ADDRESS/v2/applications/state?apikey=$RESIN_SUPERVISOR_API_KEY" | jq ".$APPNAME.appId")
curl --header "Content-Type:application/json" "$RESIN_SUPERVISOR_ADDRESS/v2/applications/${APPID}/restart-service?apikey=$RESIN_SUPERVISOR_API_KEY" -d '{"serviceName": "main"}'
