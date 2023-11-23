# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install application dependencies
RUN yarn install

# Copy source code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run your application
CMD ["yarn", "start"]
