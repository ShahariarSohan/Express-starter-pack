# Use official Node.js 24 image
FROM node:24-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npm install -g typescript
# Copy all source code
COPY . .

# Build TypeScript to JavaScript
RUN npm run build

# Expose port (change if needed)
EXPOSE 5000

# Start the app
CMD ["npm", "start"]