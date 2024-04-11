FROM node:20

WORKDIR /app

COPY package* .
COPY ./prisma .
# we are currently copying even node_module so add node_module to .dockerignore

RUN npm install
RUN npx prisma generate

COPY . .
RUN npm run build
# they don't start the application 
EXPOSE 3000
# Runs when we are creating a image
# Runs on thing which bootstrap our application

CMD ["node","dist/index.js"]
# why didn't we use RUN node index.js
# All the code run when we starting the image/container
# actually start our application