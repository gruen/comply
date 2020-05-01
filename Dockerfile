FROM strongdm/pandoc:latest

# based on implementation by James Gregory <james@jagregory.com>

RUN apt-get update -y \
  && apt-get install -y curl

ARG COMPLY_VERSION
ENV COMPLY_VERSION ${COMPLY_VERSION:-1.4.1-paging-fix}

EXPOSE 4000/tcp

# # install comply binary
# RUN curl -J -L -o /tmp/comply.tgz https://github.com/gruen/comply/releases/download/v${COMPLY_VERSION}/comply-v${COMPLY_VERSION}-linux-amd64.tgz \
#   && tar -xzf /tmp/comply.tgz \
#   && mv ./comply-v${COMPLY_VERSION}-linux-amd64 /usr/local/bin/comply

RUN curl -J -L -o /tmp/comply.tgz https://github.com/gruen/comply/releases/download/v1.4.1-paging-fix%2B001/comply-v1.4.1-paging-fix-dev-linux-amd64.tgz \
  && tar -xzf /tmp/comply.tgz \
  && mv ./comply-v1.4.1-paging-fix-dev-linux-amd64 /usr/local/bin/comply


ADD source /source
WORKDIR /source

ENTRYPOINT ["/bin/bash"]
# CMD ["which comply"]