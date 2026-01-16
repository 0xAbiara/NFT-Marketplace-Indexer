FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rindexer config and other files
COPY . .

# Install rindexer globally
RUN npm install -g rindexer

# Expose the port rindexer uses (check your config, usually 3000 or 8080)
EXPOSE 3000

# Start rindexer
CMD ["rindexer", "start", "all"]