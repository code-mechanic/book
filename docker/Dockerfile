# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install basic programs
RUN set -x -e
RUN apt update --allow-releaseinfo-change-suite
RUN apt install -y --no-install-recommends \
    pandoc \
    texlive-full \
    curl \
    wget \
    build-essential

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN . ~/.bashrc && nvm install --lts && npm install -g mermaid-filter

# Set default command
CMD ["/bin/bash"]
