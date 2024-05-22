### Helm repository for the charts developed by the APA project

To deploy a chart:

1. run `make` to build packages for all the charts in `charts/` and update the index
2. `git add`, `git commit` and `git push` to update the repo

This relies on `helm` to build the packages
