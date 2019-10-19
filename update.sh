#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
  s!%%REDIS_VERSION%%!$redis_version!g;
  s!%%ALPINE_VERSION%%!$alpine_version!g;
"

sed -E "$sedStr" $1
}

redis_version="-2.2.8"
alpine_version=""
versions=(5.6)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done

redis_version=""
alpine_version="3.4"
versions=(7.0)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done


redis_version=""
alpine_version=""
versions=(7.1 7.2 7.3)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done
