#!/usr/bin/env bash
set -euo pipefail

exec dotnet $HEADLESS_DIR/Resonite.dll -LoadAssembly Libraries/ResoniteModLoader.dll -HeadlessConfig /config.json
