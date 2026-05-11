FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    ca-certificates \
    xz-utils \
    texlive-xetex \
    texlive-latex-extra \
    lmodern \
    fonts-dejavu \
    fonts-linuxlibertine \
    fonts-firacode \
    make \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @mermaid-js/mermaid-cli && \
    npm cache clean --force

# Install Pandoc 2.9.2.1
RUN wget -q https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-linux-amd64.tar.gz && \
    tar xzf pandoc-2.9.2.1-linux-amd64.tar.gz && \
    cp pandoc-2.9.2.1/bin/pandoc /usr/local/bin/ && \
    rm -rf pandoc-2.9.2.1*

WORKDIR /workspace

CMD ["/bin/bash"]