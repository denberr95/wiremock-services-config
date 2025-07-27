FROM wiremock/wiremock:latest AS builder
ENV WIREMOCK_FAKER_EXTENSION_STANDALONE_VERSION=0.2.0
ADD https://repo1.maven.org/maven2/org/wiremock/extensions/wiremock-faker-extension-standalone/${WIREMOCK_FAKER_EXTENSION_STANDALONE_VERSION}/wiremock-faker-extension-standalone-${WIREMOCK_FAKER_EXTENSION_STANDALONE_VERSION}.jar /var/wiremock/extensions/
RUN apt-get update && \
    apt-get upgrade -y && \
    groupadd --system appgroup && \
    useradd --system --gid appgroup appuser && \
    chown -R appuser:appgroup /home/wiremock
USER appuser
