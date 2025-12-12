# Changelog

All notable changes to this project will be documented in this file.

## [0.2.0] - 2025-12-10
### Added
- Reified dimension scoring model (`p6:DimensionScore`, `p6:scoreForArtifact`, `p6:scoreForDimension`, `p6:scoreValue`).
- SHACL shapes for `p6:DimensionScore` and `p6:Project` recommendations.
- Negative SHACL example (`examples/sample-p6-invalid.ttl`).
- CI workflow for TTL parsing, SHACL (valid + negative), and manifest validation.
- `Makefile`, `requirements.txt`, and `scripts/validate-manifest.py`.

### Changed
- `p6:hasDimensionScore` now links artifacts to score nodes (object property).
- `p6:implementsArtifact` domain set to `p6:Project`.
- `manifest.json` version synced with ontology (0.2.0).
- `manifest.schema.json` tightened with `$id` and semver pattern for `version`.



