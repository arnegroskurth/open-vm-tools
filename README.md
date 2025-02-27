
# arnegroskurth/open-vm-tools

[`open-vm-tools`](https://github.com/vmware/open-vm-tools) for Fedora CoreOS. See: https://github.com/coreos/fedora-coreos-tracker/issues/70

The container comes with the user `cloud-agent` that can be used to authenticate with the cloud agent when using guest RPC (has to set password via `CLOUD_AGENT_PASSWORD`).

## Running the container

```bash
$ docker run --privileged --pid=host --net=host --ipc=host --uts=host --restart always --name open-vm-tools arnegroskurth/open-vm-tools
```

> Note: Remember to add `--env CLOUD_AGENT_PASSWORD=foobar` for the guest RPC functionality to be available.

## Running as SystemD service

Can be used to run this image in a SystemD-environment like Fedora CoreOS.

```
[Unit]
Description=Open VM Tools
After=docker.service network-online.target
Requires=docker.service
Wants=network-online.target
ConditionVirtualization=vmware

[Service]
Type=simple
ExecStartPre=-docker rm -fv open-vm-tools
ExecStart=docker run --privileged --pid=host --net=host --ipc=host --uts=host --restart always --name open-vm-tools arnegroskurth/open-vm-tools
ExecStop=/usr/bin/docker stop open-vm-tools

[Install]
WantedBy=multi-user.target
```
