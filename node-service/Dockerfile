# Use the official Node.js 14 image.
FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

RUN npm install

# Bundle app source inside Docker image
COPY . .

# Your app binds to port 3000
EXPOSE 3000

CMD [ "node", "app.js" ]
