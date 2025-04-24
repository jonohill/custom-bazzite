FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250421

RUN dnf install -y \
    cockpit \
    cockpit-machines \
    libvirtd \
    tailscale 

RUN systemctl --root=/ enable cockpit.socket && \
    systemctl --root=/ enable libvirtd && \
    systemctl --root=/ enable tailscaled

RUN ostree container commit
