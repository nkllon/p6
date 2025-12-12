#!/usr/bin/env python3
import json
import sys
from pathlib import Path

try:
    from jsonschema import validate, Draft202012Validator
    from jsonschema.exceptions import ValidationError
except Exception as exc:
    print("ERROR: jsonschema is required. Install with: pip install jsonschema", file=sys.stderr)
    raise


def load_json(path: Path):
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def main():
    repo_root = Path(__file__).resolve().parents[1]
    manifest_path = repo_root / "manifest.json"
    schema_path = repo_root / "manifest.schema.json"

    if not manifest_path.exists():
        print(f"ERROR: Missing {manifest_path}", file=sys.stderr)
        sys.exit(1)
    if not schema_path.exists():
        print(f"ERROR: Missing {schema_path}", file=sys.stderr)
        sys.exit(1)

    manifest = load_json(manifest_path)
    schema = load_json(schema_path)

    try:
        Draft202012Validator.check_schema(schema)
    except Exception as exc:
        print(f"ERROR: Schema is invalid: {exc}", file=sys.stderr)
        sys.exit(2)

    try:
        validate(instance=manifest, schema=schema)
    except ValidationError as e:
        print("Manifest validation FAILED")
        print(e.message)
        # Print path to error for easier debugging
        if e.path:
            print(f"path: {'/'.join(map(str, e.path))}")
        sys.exit(3)

    # Basic consistency checks beyond schema
    files = set(manifest.get("files", []))
    missing = [p for p in files if not (repo_root / p).exists()]
    if missing:
        print("Manifest references missing files:")
        for p in missing:
            print(f" - {p}")
        sys.exit(4)

    print("Manifest validation OK")


if __name__ == "__main__":
    main()



