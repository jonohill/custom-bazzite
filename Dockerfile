FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250417

# tailscale
RUN dnf install tailscale && \
    systemctl --root=/ enable tailscaled

# rustdesk


RUN ostree container commit
