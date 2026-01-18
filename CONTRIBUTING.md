## Contributing

- Open PRs with focused changes. Include rationale in the description.
- CI must pass: Turtle parsing, SHACL (valid + negative), and manifest validation.
- Keep ontology and examples consistent; update SHACL when modeling changes.
- For releases, ensure `manifest.json` and ontology versions align.

### Local dev
```bash
python -m pip install -r requirements.txt
make test
```




