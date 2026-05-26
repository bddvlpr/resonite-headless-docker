#!/usr/bin/env bash

set -e

./scripts/update.sh
exec ./scripts/launch.sh
