#!/usr/bin/env bash
# Scaffold the canonical per-client output tree (see skills/_shared/output-structure.md).
# Usage: bootstrap-client.sh <client-folder-abs-path>
set -euo pipefail
ROOT="${1:?client folder path required}"
Y="$(date +%Y)"
mkdir -p \
  "$ROOT/00_inbox" \
  "$ROOT/reports/$Y/weekly" \
  "$ROOT/reports/$Y/monthly" \
  "$ROOT/reports/$Y/campaign" \
  "$ROOT/audits" \
  "$ROOT/creative" \
  "$ROOT/campaigns" \
  "$ROOT/research/competitors" \
  "$ROOT/research/customers" \
  "$ROOT/exports"
echo "Scaffolded output tree under: $ROOT"
