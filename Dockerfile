FROM steamcmd/steamcmd:debian

RUN apt update && \
  apt install -y curl && \
  curl https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -o /tmp/packages-microsoft-prod.deb && \
  dpkg -i /tmp/packages-microsoft-prod.deb && \
  rm -rf /tmp/packages-microsoft-prod.deb && \
  apt update && \
  apt install -y libfreetype6 dotnet-runtime-10.0 && \
  rm -rf /var/lib/apt/lists/*

COPY scripts scripts

ENV INSTALL_DIR=/srv/resonite
ENV HEADLESS_DIR=$INSTALL_DIR/Headless

STOPSIGNAL SIGINT

ENTRYPOINT ["./scripts/entrypoint.sh"]
