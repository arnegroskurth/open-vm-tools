FROM registry.fedoraproject.org/fedora-minimal:40

RUN microdnf -y --setopt=tsflags=nodocs install\
    open-vm-tools \
    envsubst \
    \
    # prevent hangs due to low entropy
    haveged \
    \
    # often used utilities when using guest RPC feature
    net-tools iproute systemd less \
    \
    && microdnf clean all

COPY tools.conf.dist /etc/vmware-tools/
ENV LOGGING_LEVEL="message"

# various systemctl operations have no effect if this is not set
# see: https://systemd.io/ENVIRONMENT/
ENV SYSTEMD_IGNORE_CHROOT=1

# used to authenticate with the cloud agent when running a command in the VM
RUN useradd cloud-agent
ENV CLOUD_AGENT_PASSWORD=""

COPY --chmod=775 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/vmtoolsd"]
