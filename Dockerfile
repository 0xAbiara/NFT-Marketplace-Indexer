FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install rindexer
RUN curl -L https://rindexer.xyz/install.sh | bash

# Add rindexer to PATH
ENV PATH="/root/.rindexer/bin:$PATH"

# Copy project files
COPY . .

# Expose port
EXPOSE 3001

# Start rindexer
CMD ["rindexer", "start", "all"]