#!/usr/bin/env bash

rm -rf capi-release*
git clone https://github.com/cloudfoundry/capi-release
STACK=cflinuxfs4 ./add_lc_bundle.rb
pushd capi-release
  git submodule update --init --recursive
  bosh create-release --force --tarball "dev_releases/capi/capi-9.9.9.tgz" --name capi --version "9.9.9"
popd
