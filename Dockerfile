FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download rindexer binary directly from GitHub releases
RUN curl -L -o rindexer.tar.gz https://github.com/joshstevens19/rindexer/releases/download/v0.29.0/rindexer_linux-amd64.tar.gz && \
    tar -xzf rindexer.tar.gz && \
    chmod +x rindexer && \
    mv rindexer /usr/local/bin/ && \
    rm rindexer.tar.gz

# Verify installation
RUN rindexer --version

# Copy project files
COPY . .

# Expose port
EXPOSE 3001

# Start rindexer
CMD ["rindexer", "start", "all"]