#!/usr/bin/env bash

set -xeuo pipefail

image_name="sensor-stream-cfn"

docker image build --tag "$image_name" .
