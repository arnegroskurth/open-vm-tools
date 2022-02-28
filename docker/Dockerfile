FROM registry.fedoraproject.org/fedora-minimal:34

RUN microdnf -y --setopt=tsflags=nodocs install\
    open-vm-tools \
    \
    # often used utilities when using guest RPC feature
    net-tools iproute systemd \
    \
    && microdnf clean all

# various systemctl operations have no effect if this is not set
# see: https://systemd.io/ENVIRONMENT/
ENV SYSTEMD_IGNORE_CHROOT=1

# used to authenticate with the cloud agent when running a command in the VM
RUN useradd --no-create-home cloud-agent
ENV CLOUD_AGENT_PASSWORD=""

COPY --chmod=775 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/vmtoolsd"]
