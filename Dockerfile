FROM confluentinc/cp-schema-registry:latest

LABEL maintainer="Swapnil Desai"

# ENV \
#     CONFLUENT_MAJOR_VERSION=5 \
#     CONFLUENT_MINOR_VERSION=3 \
#     CONFLUENT_PATCH_VERSION=1 \
#     CONFLUENT_SCALA_VERSION=2.12

RUN \
    apt-get update && \
    apt-get install -y jq

# RUN \
#     curl --fail --silent --show-error \
#         http://packages.confluent.io/archive/${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}/confluent-${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}.${CONFLUENT_PATCH_VERSION}-${CONFLUENT_SCALA_VERSION}.tar.gz \
#         > /tmp/confluent-${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}.${CONFLUENT_PATCH_VERSION}-${CONFLUENT_SCALA_VERSION}.tar.gz

# RUN \
#     tar -zxvf \
#         /tmp/confluent-${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}.${CONFLUENT_PATCH_VERSION}-${CONFLUENT_SCALA_VERSION}.tar.gz --directory / && \
#     mv /confluent-${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}.${CONFLUENT_PATCH_VERSION} /confluent && \
#     # Delete unnecessary files
#     rm -rvf \
#         /tmp/confluent-${CONFLUENT_MAJOR_VERSION}.${CONFLUENT_MINOR_VERSION}.${CONFLUENT_PATCH_VERSION}-${CONFLUENT_SCALA_VERSION}.tar.gz

# RUN curl -L --http1.1 https://cnfl.io/cli | sh -s -- -b /confluent/bin

RUN \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

ENV PATH /confluent/bin:$PATH

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

# CMD ["--help"]
