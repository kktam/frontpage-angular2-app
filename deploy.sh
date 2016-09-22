#!/bin/bash

SCHEMA=data/schema.js
RESOLVERS=data/resolvers.js

# compile js files from frontpage-server
(cd src/app/schema/frontpage-server;
npm i;
babel $SCHEMA --out-file $SCHEMA;
babel $RESOLVERS --out-file $RESOLVERS)

# fix typescript errors
(cd src/app/schema/frontpage-server;
rm -rf node_modules)

# remove references to PostUpvoterComponent from PostListComponent
npm run build:query
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-query --acl public-read)

# clean up
npm run build:mutation
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-mutation --acl public-read)

git reset --hard
