#!/usr/bin/env bash

# Read configuration from config.json
export IPA_SERVER_PASSWORD=$(jq -r '.server_password' config.json)
export IPA_HOSTNAME=$(jq -r '.hostname' config.json)
export IPA_REALM=$(jq -r '.realm' config.json)
export IPA_IP=$(jq -r '.ip' config.json)

# Make sure required env variables are defined
if [ -z "$IPA_SERVER_PASSWORD" ]
then
  echo "IPA_SERVER_PASSWORD must be defined"
  exit 1
fi

if [ -z "$IPA_HOSTNAME" ]
then
  echo "IPA_HOSTNAME must be defined"
  exit 1
fi

if [ -z "$IPA_REALM" ]
then
  echo "IPA_REALM must be defined"
  exit 1
fi

if [ -z "$IPA_IP" ]
then
  echo "IPA_IP must be defined"
  exit 1
fi

# Create Vagrantfile from template
envsubst < Vagrantfile.template > Vagrantfile

# Bring up the ipa-server instance
vagrant up
