# Build Stage
FROM node:14.x-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Final Stage
FROM node:14.x-alpine

WORKDIR /app

COPY --from=build /app ./
COPY package.json package-lock.json ./
RUN npm install --production

CMD ["npm", "run", "start"]













# FROM node:alpine

# WORKDIR /app

# COPY package.json .
# COPY package-lock.json .
# COPY . . 

# RUN npm i 

# CMD ["npm", "run", "start"]
