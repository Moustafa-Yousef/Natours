# Use an official node runtime as a parent image
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies 
RUN npm install

# Copy the rest of the application code
COPY . 

# Build the application
RUN npm run build

# Use a smaller image to serve the build
FROM nginx:alpine

# Copy the build output to Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Ngi
CMD ["nginx", "-g", "daemon off;"]
