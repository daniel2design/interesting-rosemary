#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e4473bb3bef1b0013fdfcfc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e4473bb3bef1b0013fdfcfc
curl -s -X POST https://api.stackbit.com/project/5e4473bb3bef1b0013fdfcfc/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e4473bb3bef1b0013fdfcfc/webhook/build/publish > /dev/null
