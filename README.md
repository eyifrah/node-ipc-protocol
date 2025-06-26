# node-ipc-protocol

This repository defines the shared gRPC based IPC protocol for communication between services running on the node.

## build 
- Docker based to save you the dependency nightmare and stabilize resuls.


## Structure
- `proto/` — Protocol buffer (`.proto`) files defining the gRPC API.
- `ipcpaths/` — Go files with shared constants, such as the Unix domain socket path.
- `gen/go/nodeipc/` — Generated Go code from the proto files.

## Usage
- Import proto files in your server/client projects and generate code as needed.
- Import `ipcpaths` for the shared socket path in both server and client implementations.
- Import generated Go code from `gen/go/nodeipc` in your Go projects.

## Regenerating Go Code
If you update the proto files, regenerate the Go code by running:

```sh
./build-go.sh
```

This script uses Docker to ensure all dependencies are available, so you do not need to install protoc or Go plugins locally.
Then commit the updated files to this repository.
