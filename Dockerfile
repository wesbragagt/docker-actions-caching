FROM mhart/alpine-node:14 as builder

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

COPY workspaces/minimal-blog/package.json ./workspaces/minimal-blog/package.json

RUN yarn install --frozen-lockfile --quiet

COPY . ./

RUN yarn build

FROM nginx:alpine

WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=builder /app/public .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
