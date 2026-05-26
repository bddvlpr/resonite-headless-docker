#!/usr/bin/env bash
set -euo pipefail

echo "Updating and/or validating Resonite..."
steamcmd \
  +@sSteamCmdForcePlatformType windows \
  +force_install_dir "$INSTALL_DIR" \
  +login ${STEAM_USERNAME} ${STEAM_PASSWORD} \
  +app_license_request 2519830 \
  +app_update 2519830 \
  -beta ${STEAM_BRANCH} \
  -betapassword ${STEAM_BRANCH_PASSWORD} \
  validate \
  +quit

echo "Updating and/or validating mod loader..."
mkdir -p "$HEADLESS_DIR"/{Libraries,rml_mods,rml_libs,rml_config}

curl -SsL "https://github.com/resonite-modding-group/ResoniteModLoader/releases/latest/download/0Harmony.dll" \
  -o "$HEADLESS_DIR/rml_libs/0Harmony.dll"
curl -SsL "https://github.com/resonite-modding-group/ResoniteModLoader/releases/latest/download/ResoniteModLoader.dll" \
  -o "$HEADLESS_DIR/Libraries/ResoniteModLoader.dll"

echo "Updating and/or validating mods..."
curl -SsL "https://github.com/New-Project-Final-Final-WIP/HeadlessTweaks/releases/latest/download/HeadlessTweaks.dll" \
  -o "$HEADLESS_DIR/rml_mods/HeadlessTweaks.dll"
curl -SsL "https://github.com/New-Project-Final-Final-WIP/HeadlessTweaks/releases/latest/download/Discord.Net.Core.dll" \
  -o "$HEADLESS_DIR/rml_libs/Discord.Net.Core.dll"
curl -SsL "https://github.com/New-Project-Final-Final-WIP/HeadlessTweaks/releases/latest/download/Discord.Net.Rest.dll" \
  -o "$HEADLESS_DIR/rml_libs/Discord.Net.Rest.dll"
curl -SsL "https://github.com/New-Project-Final-Final-WIP/HeadlessTweaks/releases/latest/download/Discord.Net.Webhook.dll" \
  -o "$HEADLESS_DIR/rml_libs/Discord.Net.Webhook.dll"
curl -SsL "https://codeberg.org/Raidriar/StresslessHeadless/releases/download/latest/StresslessHeadless.dll" \
  -o "$HEADLESS_DIR/rml_mods/StresslessHeadless.dll"
