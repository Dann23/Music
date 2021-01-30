# build app
FROM node:8.15-alpine as build
# Metadata Params
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:1.15.8-alpine
# Metadata Params
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80

# Metadata
LABEL \
	org.label-schema.schema-version="1.0" \
	org.label-schema.vendor="Health Club Systems" \
	org.label-schema.name="clubsys/clients-front-end" \
	org.label-schema.description="The front end website for managing Club Systems clients" \
	org.label-schema.url="https://git.healthclubsystems.com/apps/clientsfrontend" \
	org.label-schema.vcs-url="https://git.healthclubsystems.com/apps/clientsfrontend.git" \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.version=$BUILD_VERSION

CMD ["nginx", "-g", "daemon off;"]
