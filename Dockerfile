FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN npm install --silent

# add app
COPY . ./
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# start app
CMD ["npm", "start"]