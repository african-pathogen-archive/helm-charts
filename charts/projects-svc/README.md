### Helm Chart for projects-svc

This packages the [projects-svc](https://github.com/african-pathogen-archive/projects-svc) service.

It depends on a PostgreSQL database that can be deployed with:

```bash
helm upgrade --install projects-svc-db bitnami-full-index/postgresql --version 10.3.13 -f db_values.yml -n apa
```

where `db_values.yml` contains:

```yaml
postgresqlDatabase: projects-svc
global:
  storageClass: "cinder-csi"
```

Then the Project Service can be installed with:

```bash
helm upgrade --install projects-svc apa/projects-svc --debug -f values.yml -n apa
```

where the `values.yml` is based on the `example_values.yml` in this repository.

To update the service, uninstall with:

```bash
helm uninstall -n apa projects-svc
```

and re-install again.

