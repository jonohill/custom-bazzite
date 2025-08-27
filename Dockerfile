FROM ghcr.io/ublue-os/bazzite-deck-gnome:42.20250825

COPY root/ /

RUN rpm --import https://kopia.io/signing-key && \
    dnf install -y \
        kopia \
        rclone

RUN systemctl --root=/ enable kopia

RUN ostree container commit
