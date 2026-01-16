#!/bin/bash

# Try to find rindexer in different locations
if [ -f "$HOME/.rindexer/bin/rindexer" ]; then
    export PATH="$HOME/.rindexer/bin:$PATH"
elif [ -f "$HOME/.cargo/bin/rindexer" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
elif [ -f "/usr/local/bin/rindexer" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# Verify and start
which rindexer
rindexer --version
rindexer start all