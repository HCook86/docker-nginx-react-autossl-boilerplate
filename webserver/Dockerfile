# Compile ReactJS application
FROM node:18 AS builder

# Set the working directory inside the builder container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY ./app/package.json ./app/package-lock.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Now copy the rest of the application (including public and src)
COPY ./app /app

# Build the React app
RUN npm run build

# Start Nginx webserver
FROM nginx:latest

# Copy compiled React build files to Nginx's default public directory
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom Nginx configuration
COPY ./nginx.conf.template /etc/nginx/nginx.conf.template

# Expose port 80
EXPOSE 80

# Declare ARG to receive value from docker-compose.yml
ARG NGINX_SERVER_NAME

# Set it as an ENV variable in the container
ENV NGINX_SERVER_NAME=${NGINX_SERVER_NAME}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run Nginx in the foreground
CMD ["/entrypoint.sh"]

