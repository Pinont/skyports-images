#!/bin/bash

# ref: https://github.com/pterodactyl/yolks/blob/master/java/entrypoint.sh

TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /app/data || exit 1

# Print Java version
printf "\033[1m\033[33mskyports@pinont:~ \033[0mjava -version\n"
java -version

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED=$(echo "${START}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

# Display the command we're running in the output, and then execute it with the env
# from the container itself.
printf "\033[1m\033[33mskyports@pinont:~ \033[0m%s\n" "$PARSED"
# shellcheck disable=SC2086
exec env ${PARSED}