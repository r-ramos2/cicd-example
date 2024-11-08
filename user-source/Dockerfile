# Use official Node.js image as a parent image
FROM node:14-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and index.js to the working directory
COPY package.json ./
COPY index.js ./

# Install dependencies (in this case, just confirming with npm install)
RUN npm install

# Expose port 8080
EXPOSE 8080

# Run the app when the container starts
CMD ["npm", "start"]
