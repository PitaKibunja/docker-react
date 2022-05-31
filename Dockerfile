FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# FROM node:12.2.0-alpine as build

# #also say
# WORKDIR /app

# #copy the react app to the container
# COPY . /app/

# #Prepare the contianer for building react
# RUN npm install --silent
# RUN npm install react-script@3.0.1 -g --silent

# RUN npm run build

# #prepare nginx
# FROM nginix:1.16.0-alpine
# COPY --from=build /app/build /usr/share/nginx/html
# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx/nginx.conf /etc/nginx/conf.d

# #fire up nginx
# EXPOSE 80
# CMD ["nginx","-g","daemon off;"]