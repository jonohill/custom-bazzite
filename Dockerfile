FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250421

# tailscale
RUN dnf install tailscale && \
    systemctl --root=/ enable tailscaled

# cockpit
RUN dnf install cockpit && \
    systemctl --root=/ enable cockpit.socket

RUN ostree container commit
