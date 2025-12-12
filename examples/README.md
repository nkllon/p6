# Examples

This folder contains a small synthetic dataset to exercise the ontology and SHACL shapes.

Files:
- `sample-p6.ttl` — minimal program/projects/activities/resources and sample dimension links.

Validate with pySHACL (example):
```bash
python3 -m pip install pyshacl rdflib
pyshacl -s ../shapes/p6-shacl.ttl -m -i turtle -f human sample-p6.ttl
```

Syntax check with rdflib (simple parse):
```bash
python3 - <<'PY'
from rdflib import Graph
g = Graph()
g.parse("sample-p6.ttl", format="turtle")
print(f"Triples: {len(g)}")
PY
```


