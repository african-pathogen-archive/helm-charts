all: charts/packaged docs/index.yaml
docs/index.yaml: $(wildcard docs/*.tgz)
	helm repo index ./docs --url https://african-pathogen-archive.github.io/helm-charts/

charts/packaged: $(shell find charts/* -type d)
	for package in $? ; do \
		if [ -f "$$package/Chart.yaml" ]; then \
			echo "Packaging $$package"; \
			helm package -d docs/ "$$package"; \
		else \
			echo "Skipping $$package, no Chart.yaml found"; \
		fi; \
	done
	touch charts/packaged