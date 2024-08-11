# syntax=docker/dockerfile:1
# Testing the continuous Code Commit
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000