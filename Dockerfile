FROM node:14.16.0-alpine3.13
RUN addgroup app && adduser -S -G app app
RUN mkdir /app && chown app:app /app
USER app
WORKDIR /app/
RUN mkdir data  
COPY package*.json ./
RUN npm install
COPY . .
ENV API_URL="https://api.myapp.com/"
EXPOSE 3000
USER node
CMD ["npm", "start"]
    
