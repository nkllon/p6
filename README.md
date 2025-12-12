# Primavera / Oracle P6 — 21+1 Dimensional Fort/SCIG Probe

This bundle is a Fort-aligned, 21+1 dimensional “full monty” parse of **Oracle Primavera P6 / Primavera P6 EPPM** as an enterprise project & portfolio management platform.  
It is opinionated and architect‑centric rather than product‑marketing centric.

Artifacts included:

- `p6-21plus1-analysis.md` — narrative analysis of P6 across 21+1 dimensions
- `ontology/p6-21plus1.ttl` — Turtle ontology sketching P6 concepts and mapping to the 21+1 meta‑model
- `diagrams/p6-context.puml` — PlantUML context / bow‑tie style view
- `diagrams/p6-21plus1.mmd` — Mermaid diagram of dimensions vs concern clusters
- `diagrams/p6-architecture.dot` — Graphviz DOT architecture sketch
- `LICENSE` — MIT license
- `manifest.json` — machine‑readable manifest with timestamp and version

All dimension names are **provisional** and meant to be aligned with your canonical 21+1 SCIG definition in Fort. Treat this as a worked example / probe rather than a final source of truth.

## Quickstart

### Render diagrams
Requires PlantUML, Graphviz, and Mermaid CLI (`mmdc`) on PATH.
```bash
bash scripts/render-diagrams.sh
```
Rendered outputs will be placed under `diagrams/rendered/`.

### Validate ontology and shapes
Install Python dependencies and run SHACL on the example dataset:
```bash
python -m pip install pyshacl rdflib
pyshacl -s shapes/p6-shacl.ttl -i turtle -m -f human examples/sample-p6.ttl
```

### What’s canonical vs provisional
- The ontology uses HTTPS IRIs under `nkllon.org`. Provisional dimension IRIs are provided under `https://nkllon.org/dimension#`.
- See `ontology/dimension-map.ttl` for mapping stubs to your canonical Fort 21+1 dimension vocabulary. Replace with your canonical import when ready.

## Reified dimension scoring (0.2.0)

Dimension scores are now modeled as first-class nodes. Artifacts (e.g., `p6:ScheduleModel`) link to `p6:DimensionScore` via `p6:hasDimensionScore`. Each score node references the artifact, the dimension, and a numeric value in [0,1].

Example:

```12:29:/Volumes/lemon/cursor/p6/examples/sample-p6.ttl
p6:ScheduleAlpha a p6:ScheduleModel ;
  rdfs:label "Alpha Schedule Model" ;
  p6:hasDimensionScore [
    a p6:DimensionScore ;
    p6:scoreForArtifact p6:ScheduleAlpha ;
    p6:scoreForDimension dim:D1_TimeSchedule ;
    p6:scoreValue "0.82"^^xsd:decimal
  ] .
```

Validate with SHACL:

```bash
make shacl
```

## CI and local tooling

- Run all checks locally:
```bash
python -m pip install -r requirements.txt
make test
```
- Validate manifest against schema:
```bash
python scripts/validate-manifest.py
```
- GitHub Actions runs parsing, SHACL (valid + negative), and manifest validation on PRs.
