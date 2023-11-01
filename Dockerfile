FROM node:16

# Set working directory
WORKDIR /app

# Copy package file
COPY package*.json ./
COPY prisma ./
COPY tsconfig.json ./

RUN npm install

COPY . .

RUN npm run build
RUN npx prisma generate

EXPOSE 8080

CMD [ "node", "dist/index.js"]
