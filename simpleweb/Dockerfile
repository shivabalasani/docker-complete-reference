# Specify a base image
FROM node:alpine

# Any following command wil be executed relative to this path in the container
WORKDIR /usr/app

# Install some depenendencies
COPY ./package.json ./
RUN npm install
COPY ./ ./

# Default command
CMD ["npm", "start"]