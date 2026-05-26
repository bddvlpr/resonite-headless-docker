#!/usr/bin/env bash
set -euo pipefail

cd $HEADLESS_DIR

exec dotnet Resonite.dll -LoadAssembly Libraries/ResoniteModLoader.dll -HeadlessConfig /config.json
