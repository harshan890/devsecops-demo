# here Base Image
FROM node:20-alpine

# Working Directory
WORKDIR /app

# Copy files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy files to the working directory
COPY . .

# build the project
RUN npm run build

# Install 'serve' package globally to serve the built files
RUN npm install -g serve

# Exposing the port
EXPOSE 5173

# Starting the app
CMD ["serve", "-s", "dist", "-l", "5173"]
