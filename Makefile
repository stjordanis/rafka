.PHONY: install build test lint vet fmt clean list

all: vet fmt test install test

install: vet fmt test
	go install

build: vet fmt test
	go build

test:
	go test -race
	cd test && bundle install --frozen && ./end-to-end -v

lint:
	golint

vet:
	go vet

fmt:
	! gofmt -d -e -s *.go 2>&1 | tee /dev/tty | read

clean:
	go clean
