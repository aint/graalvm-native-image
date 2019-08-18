FROM ubuntu
MAINTAINER Oleksandr Tyshkovets

RUN apt-get update && \
    apt-get -y install gcc libc6-dev zlib1g-dev curl bash && \
    rm -rf /var/lib/apt/lists/*

# GraalVM

ENV GRAAL_VERSION 19.1.1
ENV GRAAL_FILENAME graalvm-ce-linux-amd64-${GRAAL_VERSION}.tar.gz

RUN curl -4 -L https://github.com/oracle/graal/releases/download/vm-${GRAAL_VERSION}/${GRAAL_FILENAME} -o /tmp/${GRAAL_FILENAME}

RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp \
    && mv /tmp/graalvm-ce-${GRAAL_VERSION} /usr/lib/graalvm \
    && /usr/lib/graalvm/bin/gu install native-image

RUN rm -rf /tmp/*

VOLUME /project
WORKDIR /project

ENTRYPOINT ["/usr/lib/graalvm/bin/native-image"]
