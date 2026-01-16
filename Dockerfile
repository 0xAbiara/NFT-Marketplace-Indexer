FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install rindexer using their official installation script
RUN curl -L https://rindexer.xyz/install.sh | bash

# Add rindexer to PATH
ENV PATH="/root/.rindexer/bin:${PATH}"

# Copy all project files
COPY . .

# Expose the port rindexer uses (typically 3001)
EXPOSE 3001

# Start rindexer
CMD ["rindexer", "start", "all"]