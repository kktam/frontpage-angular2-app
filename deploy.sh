#!/bin/bash

# remove references to PostUpvoterComponent from PostListComponent
npm run build:query
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-query --acl public-read)

# clean up
npm run build:mutation
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-mutation --acl public-read)

git reset --hard