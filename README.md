# Canvas LMS Helm chart

❗ Please note that I make no claims about production-readiness of this; use at your own risk.

This is [Canvas LMS](https://github.com/instructure/canvas-lms) as a batteries-included Helm chart, inspired by [this repo](https://github.com/instructure/canvas-self-hosted), only for Kubernetes.

# Trademarks
All trademarks mentioned in the offering are owned by the respective companies, and the use of them does not imply any affiliation or endorsement.

# Deployment
[TODO]

# Local development

As is usually the case with K8s, this can run on practically any cluster, local or otherwise.

The supplied dev configuration, somewhat opnionatedly but mainly for convenience, presumes the use of [Tilt](https://tilt.dev), [ctlptl](https://github.com/tilt-dev/ctlptl), and [minikube](https://minikube.sigs.k8s.io/), and the included ctlptl spec is configured for Docker runtime to take advantage of in-cluster builds, without a local registry.

## Set up

1. [Install Tilt](https://docs.tilt.dev/).
2. [Install minikube](https://minikube.sigs.k8s.io/docs/) and all its dependencies.
3. [Install ctlptl](https://github.com/tilt-dev/ctlptl).
4. Clone this repo.
5.
```
cd canvas-lms-helm
git submodule update --init --recursive
ctlptl -f ctlptl-cluster-spec.yaml apply
```

## Configure
Copy `values.example.yaml` into `values.override.yaml`.

If you don't want the included Postgres or Redis, disable them (by setting `posgres.enabled: false`, `redis.enabled: false` respectively) and update the connection settings to point to your instances.

## Run
1. In your terminal, from within the repo's directory, `tilt up`.
2. Open [http://localhost:10350/](http://localhost:10350/) in your browser and watch the status of the build/rollout. Note that the initial build of Canvas LMS image can take quite a while.
3. Once everything turned green, you can access Canvas at [http://localhost:3000/](http://localhost:3000/).
4. Look up log in credentials in your `values.override.yaml`.
