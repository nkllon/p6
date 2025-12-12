#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/diagrams"
OUT_DIR="$SRC_DIR/rendered"
mkdir -p "$OUT_DIR"

echo "Rendering diagrams to: $OUT_DIR"

# PlantUML
if command -v plantuml >/dev/null 2>&1; then
  echo "Rendering PlantUML..."
  plantuml -tsvg -o "$(basename "$OUT_DIR")" "$SRC_DIR/p6-context.puml"
  plantuml -tpng -o "$(basename "$OUT_DIR")" "$SRC_DIR/p6-context.puml"
else
  echo "Skipping PlantUML (plantuml not found)"
fi

# Graphviz
if command -v dot >/dev/null 2>&1; then
  echo "Rendering Graphviz DOT..."
  dot -Tsvg "$SRC_DIR/p6-architecture.dot" -o "$OUT_DIR/p6-architecture.svg"
  dot -Tpng "$SRC_DIR/p6-architecture.dot" -o "$OUT_DIR/p6-architecture.png"
else
  echo "Skipping Graphviz (dot not found)"
fi

# Mermaid
if command -v mmdc >/dev/null 2>&1; then
  echo "Rendering Mermaid..."
  mmdc -i "$SRC_DIR/p6-21plus1.mmd" -o "$OUT_DIR/p6-21plus1.svg"
  mmdc -i "$SRC_DIR/p6-21plus1.mmd" -o "$OUT_DIR/p6-21plus1.png"
else
  echo "Skipping Mermaid (mmdc not found)"
fi

echo "Done."


