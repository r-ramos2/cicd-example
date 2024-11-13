# Use the official NGINX image
FROM nginx:latest

# Copy a custom NGINX configuration file, if needed (optional step)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the web server
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
