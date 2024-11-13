# Use the official NGINX image from Docker Hub
FROM nginx:latest

# Copy the custom nginx.conf (if any)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

