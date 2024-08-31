# Use the official Node.js image.
FROM node:16

WORKDIR /app

COPY . /app

# Install dependencies.
RUN npm install

# Build the application (if you have a build step).
RUN npm run build

# Expose the port the app runs on.
EXPOSE 1250

# Command to run the application.
CMD ["npm", "start"]
