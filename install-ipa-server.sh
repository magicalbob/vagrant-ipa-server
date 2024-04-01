#!/usr/bin/env bash

# Make sure required env variables are defined
if [ -z "$IPA_SERVER_PASSWORD" ]
then
  echo "IPA_SERVER_PASSWORD must be define"
  exit 1
fi

# Create Vagrantfile from template
envsubst < Vagrantfile.template > Vagrantfile

# Bring up the ipa-server instance
vagrant up
