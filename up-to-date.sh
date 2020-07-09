#!/usr/bin/env bash -ex

exit $(git rev-list --left-right --count origin/master...origin/$BRANCH_NAME | exec grep -oP '^\d+')
