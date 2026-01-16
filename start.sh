#!/bin/bash

# Install rindexer if not already installed
if ! command -v rindexer &> /dev/null; then
    echo "Installing rindexer..."
    curl -L https://rindexer.xyz/install.sh | bash
fi

# Add rindexer to PATH
export PATH="$HOME/.rindexer/bin:$PATH"

# Verify installation
which rindexer
rindexer --version

# Start rindexer
rindexer start all