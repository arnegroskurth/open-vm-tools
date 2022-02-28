FROM alpine:3
RUN apk add --no-cache open-vm-tools

# used to authenticate with the cloud agent when running a command in the VM
RUN adduser -D cloud-agent
ENV CLOUD_AGENT_PASSWORD=""

COPY --chmod=775 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/vmtoolsd"]
