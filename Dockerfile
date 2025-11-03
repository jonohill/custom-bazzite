FROM ghcr.io/ublue-os/bazzite-deck-gnome:43.20251102

COPY root/ /

RUN rpm --import https://kopia.io/signing-key && \
    dnf install -y \
        cockpit \
        cockpit-machines \
        docker \
        kopia \
        rclone

RUN systemctl --root=/ enable cockpit.socket && \
    systemctl --root=/ enable docker && \
    systemctl --root=/ enable kopia

RUN ostree container commit
