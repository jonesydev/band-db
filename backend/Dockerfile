FROM node:24-alpine

WORKDIR /

COPY package*.json ./
COPY prisma ./prisma/

RUN npm ci --omit=dev

RUN npx prisma generate

COPY . .

EXPOSE 3000

CMD ["npm", "run", "start"]