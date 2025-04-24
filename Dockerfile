FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250421

RUN dnf install -y \
    cockpit \
    tailscale 

RUN systemctl --root=/ enable cockpit.socket && \
    systemctl --root=/ enable tailscaled

RUN ostree container commit
