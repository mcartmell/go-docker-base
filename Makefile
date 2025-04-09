CGO_ENABLED=0
OS=linux
ARCH=amd64
APPNAME=my-go-app
DKR=CHANGEME:5000
NAMESPACE=default
VERSION:=$(shell go tool svu next --always)
TAG=${DKR}/${APPNAME}:$(VERSION)

build: 
	git tag ${VERSION}
	docker buildx build --platform ${OS}/${ARCH} -t ${TAG} --push .

deploy:
	kubectl set image deployment/${APPNAME} ${APPNAME}=${TAG} -n ${NAMESPACE}
