# Releasing

1. Bump ontology version
   - In `ontology/p6-21plus1.ttl`, update `fort:version`, `owl:versionInfo`, and `owl:versionIRI`.
2. Render diagrams locally
   - `bash scripts/render-diagrams.sh`
3. Validate
   - `python -m pip install pyshacl rdflib`
   - `pyshacl -s shapes/p6-shacl.ttl -i turtle -m -f human examples/sample-p6.ttl`
4. Update manifest if needed
   - Ensure `manifest.json` matches files and includes correct `ontology.versionIRI`.
5. Commit and tag
   - `git commit -am "Release vX.Y.Z"`
   - `git tag vX.Y.Z`
6. Push and verify CI
   - `git push && git push --tags`
7. Create GitHub Release
   - Attach rendered diagrams from `diagrams/rendered/` and link to ontology files.


