all: charts/packaged docs/index.yaml
docs/index.yaml: $(wildcard docs/*.tgz)
	helm repo index ./docs --url https://african-pathogen-archive.github.io/helm-charts/

charts/packaged: $(shell find charts -type f)
	helm package -d docs/ \$(echo $< | sed 's^charts/([^/]+)^charts/\1^')
	touch charts/packaged