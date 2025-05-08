# Canvas LMS Helm chart

Refer back to the parent repo: https://github.com/ulevitsky/canvas-lms-helm

```sh
kubectl exec -it postgresql-0 -n canvas -- psql -U postgres -d canvas 
```


❗ Please note that I make no claims about production-readiness of this; use at your own risk.

❕ **Trademarks**: all trademarks are owned by the respective companies, and the use of them does not imply any affiliation or endorsement.

This is [Canvas LMS](https://github.com/instructure/canvas-lms) packaged as a batteries-included Helm chart.

This project was inspired by [this repo](https://github.com/instructure/canvas-self-hosted), only it's meant for use with Kubernetes/Helm, not with Docker Compose.

# Quickstart

With your target cluster and namespace as your current context, run:

```bash
helm -n canvas upgrade -i canvas . -f ./values.override.yaml
```

then try accessing `http://localhost:3000` in your browser. Please be patient because it might take Canvas a while to pull images, initialise, and start.

Once it's up and running and the log in page is showing, log in as `me@example.com` with `password`.

# Deployment

```bash
cd chart
helm -n canvas upgrade -i canvas . 
```

# Local development

The supplied dev configuration, somewhat opnionatedly but mainly for convenience, presumes the use of [Tilt](https://tilt.dev), [ctlptl](https://github.com/tilt-dev/ctlptl), and [minikube](https://minikube.sigs.k8s.io/), and the included ctlptl spec is configured for Docker runtime to take advantage of in-cluster builds, without a local registry.

## Set up

1. [Install Tilt](https://docs.tilt.dev/).
2. [Install minikube](https://minikube.sigs.k8s.io/docs/) and all its dependencies.
3. [Install ctlptl](https://github.com/tilt-dev/ctlptl).
4. Clone this repo.
5.

```bash
cd canvas-lms-helm
git submodule update --init --recursive
ctlptl -f ctlptl-cluster-spec.yaml apply
```

## Configure

Create file `values.override.yaml`. It can be left empty.

## Run

1. In your terminal, from within the repo's directory, `tilt up`.
2. Open [http://localhost:10350/](http://localhost:10350/) in your browser and watch the status of the build/rollout. Note that the initial build of Canvas LMS image can take quite a while.
3. Once everything turned green, you can access Canvas at [http://localhost:3000/](http://localhost:3000/).
4. Look up log in credentials in your `values.yaml`.

# Build

## Canvas LMS
To pull the latest Canvas LMS code, run:

```bash
cd canvas-lms
git fetch
git checkout release/<latest-tag>
cd -
git submodule update --init --recursive
```

To build and push image from latest Canvas LMS source, run:

```bash
./scripts/build-push-image-lms.sh
```
