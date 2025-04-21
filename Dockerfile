FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250421

# tailscale
RUN dnf install tailscale && \
    systemctl --root=/ enable tailscaled

# rustdesk
RUN LATEST_RUSTDESK=$(curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest | jq -r .tag_name) && \
    curl -fsL -o /tmp/rustdesk.rpm https://github.com/rustdesk/rustdesk/releases/download/$LATEST_RUSTDESK/rustdesk-$LATEST_RUSTDESK-0.x86_64.rpm && \
    dnf install -y /tmp/rustdesk.rpm && \
    rm -f /tmp/rustdesk.rpm

RUN ostree container commit
