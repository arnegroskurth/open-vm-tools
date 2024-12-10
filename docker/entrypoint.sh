#!/bin/sh

if [ ! -z "${CLOUD_AGENT_PASSWORD}" ]; then
  echo "cloud-agent:${CLOUD_AGENT_PASSWORD}" | chpasswd
else
  echo "Missing password for user cloud-agent via CLOUD_AGENT_PASSWORD" > /dev/stderr
fi

echo "Applying configuration..." > /dev/stderr
envsubst < /etc/vmware-tools/tools.conf.dist > /etc/vmware-tools/tools.conf

echo "vmtoolsd version: $(vmtoolsd --version)" > /dev/stderr

exec "$@"
