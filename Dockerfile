FROM node:18-alpine

WORKDIR /app

# Install rindexer using their installation method
RUN npm install -g @rindexer/cli

# Copy all project files
COPY . .

# Expose the port (rindexer typically uses 3001, check your config)
EXPOSE 3001

# Start rindexer
CMD ["rindexer", "start", "all"]