FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250916

COPY root/ /

RUN rpm --import https://kopia.io/signing-key && \
    dnf install -y \
        cockpit \
        cockpit-machines \
        kopia \
        rclone

RUN systemctl --root=/ enable cockpit.socket && \
    systemctl --root=/ enable kopia

RUN ostree container commit
