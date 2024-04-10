VERSION=$(shell git describe --tags --abbrev=0)
DEFAULT_IMAGE=bot:${VERSION}

linux:
	make build GOOS=linux GOARCH=amd64

arm:
	make build GOOS=darwin GOARCH=arm64

Windows:
	make build GOOS=windows GOARCH=amd64

macOS:
	make build GOOS=darwin GOARCH=amd64

dependencies:
	go get

format:
	gofmt -s -w ./

lint:
	golint

build: format dependencies
	CGO_ENABLED=0 go build -v -o bot -ldflags "-X="github.com/mlnvskk/bot/cmd.appVersion=${VERSION}

docker-build:
	docker build --tag ${DEFAULT_IMAGE} .

clean:
	docker rmi ${DEFAULT_IMAGE}
