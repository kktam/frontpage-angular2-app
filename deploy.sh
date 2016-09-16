#!/bin/bash

# remove references to PostUpvoterComponent from PostListComponent
npm run build:step1
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-step1 --acl public-read)

# clean up
git reset --hard
npm run build:step2
(cd dist;
aws s3 sync . s3://dev.apollodata.com/frontpage-angular2-app-step2 --acl public-read)

git reset --hard