FROM ubuntu

LABEL maintainer="olexandr.tyshkovets@gmail.com"

ENV GRAAL_VERSION 19.2.1
ENV GRAAL_FILENAME graalvm-ce-linux-amd64-${GRAAL_VERSION}.tar.gz

RUN apt-get update \
    && apt-get -y install curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sL https://github.com/oracle/graal/releases/download/vm-${GRAAL_VERSION}/${GRAAL_FILENAME} | tar xz -C /tmp \
    && mv /tmp/graalvm-ce-${GRAAL_VERSION} /usr/lib/graalvm \
    && /usr/lib/graalvm/bin/gu install native-image \
    && rm -rf /tmp/*

VOLUME /project
WORKDIR /project

ENTRYPOINT ["/usr/lib/graalvm/bin/native-image"]
