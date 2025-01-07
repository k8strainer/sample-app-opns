VERSION="2.0.0"
## use main.go.v1
#VERSION="1.0.0"
## use main.go.v2
go mod init sample-app
go mod tidy
podman build -t gcr.io/cluster-01-271319/sample-app-opns:$VERSION .
podman push gcr.io/cluster-01-271319/sample-app-opns:$VERSION

