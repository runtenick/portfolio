# Step 1: Build the Hugo site
FROM klakegg/hugo:ext AS builder

WORKDIR /src
COPY . .

# Build the Hugo site
RUN hugo

# Step 2: Serve the Hugo site with Nginx
FROM nginx:alpine

# Copy the generated files to the nginx directory
COPY --from=builder /src/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]