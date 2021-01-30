# CS Admin Front End

> The front end website for managing Club Systems admin stuff.

## TODO:
- [ ] tests

## Build Setup

```bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run all tests
npm test
```

## Deploy on Docker

```bash
make build
make tag-latest

# Run Vue.js app with Docker
docker run -it -p 8080:80 --rm --name club1 clubsys/clients-front-end
# The Vue.js app will be on localhost:8080.

make release
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
