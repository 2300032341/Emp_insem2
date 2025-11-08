# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files first for dependency installation
COPY package*.json ./

# Install dependencies (only production dependencies)
RUN npm install --production

# Copy rest of the backend source code
COPY . .

# Expose backend port
EXPOSE 3000

# Set environment variable (optional)
ENV NODE_ENV=production

# Start the backend server
CMD ["npm", "start"]
