#!/usr/bin/env bash -ex

SHA=$(git rev-parse HEAD)

curl -X POST  -H "Accept: application/vnd.github.v3+json" \
https://$GITHUB_SECRET:x-oauth-basic@api.github.com/repos/pchynoweth/jenkins-test/statuses/$SHA \
-d "{\"state\":\"$1\", \"context\":\"$2\"}"
