GOPATH:=$(shell go env GOPATH)
#MODIFY=Mproto/imports/api.proto=github.com/micro/go-micro/v2/api/proto

# 获取当前工作目录
PWD=$(shell pwd)

.PHONY: proto
proto:    
#	protoc3 --proto_path=. --go_out=plugins=grpc,paths=source_relative:. ./proto/article/*.proto
#	protoc3 --proto_path=. --go_out=plugins=grpc,paths=source_relative:. ./proto/user/*.proto
	docker run --rm -v $(PWD):$(PWD)  -w $(PWD) gzltommy/protoc --proto_path=. --go_out=paths=source_relative:. proto/article/*.proto
	docker run --rm -v $(PWD):$(PWD)  -w $(PWD) gzltommy/protoc --proto_path=. --go_out=paths=source_relative:. proto/user/*.proto
    

.PHONY: build
build: proto

	go build -o pb-demo *.go

.PHONY: test
test:
	go test -v ./... -cover

.PHONY: docker
docker:
	docker build . -t pb-demo:latest
