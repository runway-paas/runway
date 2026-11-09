# runway
Runway: a mini Heroku on Kubernetes

## Run the local cluster

A local Kubernetes cluster for development, using [kind](https://kind.sigs.k8s.io/). Runs in Docker on your machine, costs nothing.

### Prerequisites

- Docker Desktop, running
- kind
- kubectl

Install on Mac:
```bash
brew install kind kubectl
```

Install on Windows (PowerShell):
```powershell
winget install Kubernetes.kind
winget install Kubernetes.kubectl
```

On Windows, run the commands below in **Git Bash**.

### Start and stop

From the repo root:

```bash
./scripts/cluster.sh up     # create the cluster
./scripts/cluster.sh down   # delete it
```

Running `up` twice is safe; it skips creation if the cluster already exists.

### Check it worked

```bash
kubectl get nodes
```

You should see one node, `runway-control-plane`, with status `Ready`.

### Troubleshooting

- **"Docker isn't running"**: start Docker Desktop and wait for "Engine running".
- **"permission denied"**: run `chmod +x scripts/cluster.sh`, or use `bash scripts/cluster.sh up`.