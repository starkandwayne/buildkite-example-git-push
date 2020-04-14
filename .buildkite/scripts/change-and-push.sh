#!/bin/bash

set -eu

echo "--- :date: bump datestamp"

date +%s > datestamp

echo "--- :git: git commit"

[[ -n "${BUILDKITE_BUILD_CREATOR_EMAIL}" ]] && {
  git config --global user.email "${BUILDKITE_BUILD_CREATOR_EMAIL}"
  git config --global user.name  "${BUILDKITE_BUILD_CREATOR}"
}

git add datestamp
git commit -m "Bump datestamp during CI"

echo "--- :git: git push"
git push