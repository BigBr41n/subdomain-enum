#!/bin/bash

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# Set paths for the tools
SUBFINDER=$(which subfinder)
ASSETFINDER=$(which assetfinder)
AMASS=$(which amass)
HTTPX=$(which httpx)

# Check if tools are installed
if [ ! -x "$SUBFINDER" ]; then
  echo "subfinder could not be found, please install it first."
  exit 1
fi

if [ ! -x "$ASSETFINDER" ]; then
  echo "assetfinder could not be found, please install it first."
  exit 1
fi

if [ ! -x "$AMASS" ]; then
  echo "amass could not be found, please install it first."
  exit 1
fi

if [ ! -x "$HTTPX" ]; then
  echo "httpx could not be found, please install it first."
  exit 1
fi

OUTPUT="subdomains.txt"

# Run subdomain enumeration
echo "Running subfinder..."
$SUBFINDER -d $DOMAIN -silent > $OUTPUT

echo "Running assetfinder..."
$ASSETFINDER --subs-only $DOMAIN >> $OUTPUT

echo "Running amass..."
$AMASS enum -passive -d $DOMAIN >> $OUTPUT

# Sort and remove duplicates
sort -u $OUTPUT -o $OUTPUT

# Run HTTPX
echo "Running httpx..."
$HTTPX -l $OUTPUT -o httpx_output.txt

# Display results
cat httpx_output.txt
