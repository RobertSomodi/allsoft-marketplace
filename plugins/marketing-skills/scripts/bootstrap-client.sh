#!/usr/bin/env bash
# Scaffold a marketing-skills workspace tree.
#
# Two modes (see skills/_shared/output-structure.md):
#   client (default) — the canonical per-client output tree.
#   agency           — the agency-root skeleton (prospects/, clients/, _shared/).
#
# Usage:
#   bootstrap-client.sh <client-folder-abs-path>            # client tree (default)
#   bootstrap-client.sh --client <client-folder-abs-path>   # explicit client tree
#   bootstrap-client.sh --agency <agency-root-abs-path>     # agency-root skeleton
#
# Idempotent — safe to re-run; mkdir -p never clobbers existing files.
set -euo pipefail

MODE="client"
case "${1:-}" in
  --agency) MODE="agency"; shift ;;
  --client) MODE="client"; shift ;;
esac

ROOT="${1:?workspace folder path required}"

if [ "$MODE" = "agency" ]; then
  mkdir -p \
    "$ROOT/prospects" \
    "$ROOT/clients" \
    "$ROOT/_shared"
  echo "Scaffolded agency-root skeleton under: $ROOT (prospects/, clients/, _shared/)"
  exit 0
fi

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
echo "Scaffolded per-client output tree under: $ROOT"
