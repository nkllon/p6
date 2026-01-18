PY ?= python3

.PHONY: render validate shacl test lint release

render:
	@bash scripts/render-diagrams.sh

validate:
	@$(PY) scripts/validate-manifest.py

shacl:
	@pyshacl -s shapes/p6-shacl.ttl -i turtle -m -f human examples/sample-p6.ttl

test: validate shacl
	@echo "Running negative SHACL test (expect failure)"
	@set +e; pyshacl -s shapes/p6-shacl.ttl -i turtle -m -f human examples/sample-p6-invalid.ttl; status=$$?; \
	if [ "$$status" -eq 0 ]; then echo "Expected invalid dataset to fail SHACL but it passed" && exit 1; else echo "Invalid dataset correctly failed SHACL"; fi

lint:
	@echo "No linters configured yet"

release: test
	@echo "Ready to release"




