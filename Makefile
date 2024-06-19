.PHONY: proto
proto:    
	#protoc --proto_path=. --go_out=plugins=grpc,paths=source_relative:. ./proto/user/*.proto
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		./proto/user/*.proto
