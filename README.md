# go-docker-base

Some boilerplate code for creating tiny containerized Go apps.

- `make` will tag, build and push the app, incremeting the version automatically using [svu](https://github.com/caarlos0/svu).
- `make deploy` will update the deployment tag on Kubernetes.
