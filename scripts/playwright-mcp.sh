#!/usr/bin/env bash
# Launches Microsoft's Playwright MCP server (https://github.com/microsoft/playwright-mcp).
# - In Claude Code cloud sessions it reuses the pre-installed Chromium, headless.
# - On a local machine it uses Playwright's defaults (your installed Chrome, headed).
set -euo pipefail

VERSION="${PLAYWRIGHT_MCP_VERSION:-0.0.84}"
CLOUD_CHROMIUM="/opt/pw-browsers/chromium"

args=()
if [[ -x "$CLOUD_CHROMIUM" ]]; then
  args+=(--headless --isolated --no-sandbox --executable-path "$CLOUD_CHROMIUM")
fi

exec npx -y "@playwright/mcp@${VERSION}" "${args[@]}" "$@"
