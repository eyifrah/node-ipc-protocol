#!/bin/bash
set -e

PROTO_DIR="proto"
OUT_DIR="gen/go/nodeipc"
PROTO_FILE="$PROTO_DIR/node_ipc.proto"

# Build the Docker image for codegen
docker build -f Dockerfile.codegen -t proto-codegen .

docker run --rm -v "$PWD":/workspace -w /workspace proto-codegen \
  bash -c "mkdir -p $OUT_DIR && \
           protoc --go_out=$OUT_DIR --go-grpc_out=$OUT_DIR -I $PROTO_DIR $PROTO_FILE"
echo "Go code generated in $OUT_DIR" 