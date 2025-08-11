#!/usr/bin/env bash

# Bash script to check availability of a list of websites
# Usage: ./check_websites.sh

# Define list of sites to check
sites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

# Log file name
log_file="website_status.log"

# Empty or create the log file
: > "${log_file}"

echo "Checking website availability..."

# Loop through each site and check HTTP status code
for site in "${sites[@]}"; do
  # Send a HEAD request, follow redirects, silent, and output HTTP status code
  status=$(curl -I -L -s -o /dev/null -w "%{http_code}" "$site")

  if [[ "$status" -eq 200 ]]; then
    echo "${site} is UP" >> "${log_file}"
  else
    echo "${site} is DOWN" >> "${log_file}"
  fi
done

# Inform the user
echo "Results recorded in ${log_file}."