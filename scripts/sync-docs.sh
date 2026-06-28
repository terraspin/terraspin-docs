#!/usr/bin/env bash
# Sync docs from the Terraspin source repository.
# Run: ./scripts/sync-docs.sh

set -euo pipefail

TERRASPIN_REPO="${TERRASPIN_REPO:-https://github.com/terraspin/terraspin.git}"
TMP_DIR="$(mktemp -d)"
DOCS_DIR="content/docs"

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "Cloning Terraspin repo (docs only)..."
git clone --depth 1 --filter=blob:none --sparse "$TERRASPIN_REPO" "$TMP_DIR"
cd "$TMP_DIR"
git sparse-checkout set docs

echo "Syncing docs..."
cd - > /dev/null
rsync -av --delete "$TMP_DIR/docs/" "$DOCS_DIR/"

echo "Docs synced successfully."
