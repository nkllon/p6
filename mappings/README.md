# P6 RDBMS → Ontology Mapping

This folder provides scaffolding for mapping a Primavera P6 relational schema into the ontology.

- `p6-rdbms-mapping.csv`: starter columns for an inventory of table/column → class/property mappings.
- `p6-r2rml.ttl`: a sketch of R2RML/CSV RML mappings for projects; extend for activities, WBS, resources, calendars, baselines.

Considerations:
- Keys: stable IRIs for projects/activities; avoid transient surrogate keys where possible.
- Calendars: ensure consistent calendar IDs across projects; mismatches are systemic risk.
- Baselines: model baseline snapshots distinctly from live schedule models.
- Multi-project dependencies: encode cross-project links explicitly for SCIG analysis.


