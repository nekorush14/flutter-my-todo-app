FROM gitpod/workspace-full-vnc

ENV FLUTTER_HOME=/home/gitpod/flutter \
    FLUTTER_VERSION=1.17.5-stable

USER root

# Install dart
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt update && \
    apt -y install libpulse0 build-essential libkrb5-dev gcc make && \
    apt clean && \
    apt -y autoremove && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*;

USER gitpod

# Install Flutter sdk
RUN cd /home/gitpod && \
  wget -qO flutter_sdk.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz && \
  tar -xvf flutter_sdk.tar.xz && rm flutter_sdk.tar.xz

# Web is available on master dev
RUN $FLUTTER_HOME/bin/flutter channel beta && $FLUTTER_HOME/bin/flutter upgrade && $FLUTTER_HOME/bin/flutter config --enable-web

# Change the PUB_CACHE to /workspace so dependencies are preserved.
ENV PUB_CACHE=/workspace/.pub_cache

# add executables to PATH
RUN echo 'export PATH=${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${PUB_CACHE}/bin:${FLUTTER_HOME}/.pub-cache/bin:$PATH' >>~/.bashrc

# Change flutter sdk channel
# RUN flutter channel beta && flutter upgrade
