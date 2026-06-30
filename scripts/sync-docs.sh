#!/usr/bin/env bash
# Sync docs from the Terraspin source repository.
# Run: ./scripts/sync-docs.sh
#
# Transforms flat upstream .md files into Hugo-compatible sections:
#   cli.md  →  cli/_index.md  (with frontmatter extracted from H1)
# This keeps the sidebar, card titles, and breadcrumbs working.

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
cd - > /dev/null

# Wipe and rebuild docs from upstream.
# Each upstream .md becomes a Hugo section: {slug}/_index.md with frontmatter.
rm -rf "$DOCS_DIR"
mkdir -p "$DOCS_DIR"
for src in "$TMP_DIR/docs/"*.md; do
  slug="$(basename "$src" .md)"
  outdir="$DOCS_DIR/$slug"
  mkdir -p "$outdir"

  # Parse H1 as title; eat leading "# " and trailing whitespace.
  title=$(head -1 "$src" | sed 's/^# //;s/[[:space:]]*$//')
  # Fallback: capitalise slug words.
  [ -n "$title" ] || title=$(echo "$slug" | tr '-' ' ' | sed 's/\b\(.\)/\u\1/g')

  # First non-empty, non-heading, non-code-fence paragraph as description.
  desc=$(head -80 "$src" | sed '/^```/,/^```/d' | awk 'BEGIN{s=0} /^$/ {next} /^#/ {next} NF>0 {print; exit}')
  # Strip any leading "> " blockquote markers.
  desc=$(echo "$desc" | sed 's/^> //')
  # Fallback: slug as title.
  [ -n "$desc" ] || desc="$title documentation."
  [ "${#desc}" -gt 160 ] && desc="${desc:0:157}..."

  # Write _index.md: frontmatter + remainder of source (skip H1 line).
  {
    echo "---"
    echo "title: \"$title\""
    echo "description: \"$desc\""
    echo "---"
    echo
    tail -n +2 "$src"
  } > "$outdir/_index.md"

  echo "  $slug → $slug/_index.md  ($title)"
done

# Write docs root _index.md (always — we wiped the dir).
cat > "$DOCS_DIR/_index.md" << 'HUGOEOF'
---
title: "Documentation"
description: "Terraspin documentation — learn how to define, provision, and manage infrastructure as code."
type: docs
---
HUGOEOF
echo "  docs/_index.md  (Documentation)"

echo "Docs synced successfully."
