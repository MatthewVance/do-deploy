#!/bin/sh

# Deploy our cool tool to DigitalOCean.
# Make sure you set the TOKEN environment variable to your Digitialocean API token before running.

set -e     # Stop on first error
set -u     # Stop if an unbound variable is referenced

userdata=`cat ./user-data.yaml`

curl -X POST https://api.digitalocean.com/v2/droplets \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{"name":"hostname_here",
     "region":"nyc3",
     "size":"512mb",
     "image":"debian-8-x64",
     "ssh_keys":["root_public_key_finterprint_here"],
     "backups":false,
     "ipv6":true,
     "private_networking":false,
     "volumes": null,
     "user_data":"
'"$userdata"'
"}'
