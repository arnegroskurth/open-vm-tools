
# arnegroskurth/open-vm-tools

Run [`open-vm-tools`](https://github.com/vmware/open-vm-tools) in an alpine-based container.

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
After=network-online.target
Wants=network-online.target
ConditionVirtualization=vmware

[Service]
ExecStartPre=-docker rm -fv open-vm-tools
ExecStart=docker run --privileged --pid=host --net=host --ipc=host --uts=host --restart always --name open-vm-tools arnegroskurth/open-vm-tools

[Install]
WantedBy=multi-user.target
```
