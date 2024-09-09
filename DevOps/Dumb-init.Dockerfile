# Parallel Project Dockerfile

# Using Node alpine version 12.22.12 as the base image, chosen for its smaller size to reduce the Docker build image size
FROM node:12.22.12-alpine as builder

# Updates the package and upgrades installed packages in the container's Alpine Linux distribution
RUN apk update && apk upgrade

# Set working directory
WORKDIR /new-parallels-frontend

# Copy package.json and package-lock.json to the build environment
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of your application code
COPY . .

# Set the NODE_OPTIONS environment variable to use legacy OpenSSL algorithms
#ENV NODE_OPTIONS=--openssl-legacy-provider

# Build your application
RUN npm run build

# Nginx Block
FROM nginx:stable-alpine3.19-slim

# Updates the package and upgrades installed packages in the container's Alpine Linux distribution
RUN apk update && apk upgrade 

# Install dumb-init
RUN apk add --no-cache dumb-init

# Nginx working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy built files from the build stage to the production image
COPY --from=builder /new-parallels-frontend/build .

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Ensure correct permissions
RUN chmod -R 755 /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Use dumb-init as the entrypoint and start the Nginx web server
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Start the Nginx web server in the production image
CMD ["nginx", "-g", "daemon off;"]