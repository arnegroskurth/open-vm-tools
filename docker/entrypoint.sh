#!/bin/sh

if [ ! -z "${CLOUD_AGENT_PASSWORD}" ]; then
  echo "cloud-agent:${CLOUD_AGENT_PASSWORD}" | chpasswd
else
  echo "Missing password for user cloud-agent via CLOUD_AGENT_PASSWORD" > /dev/stderr
fi

vmtoolsd --version

exec "$@"
