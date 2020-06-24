.PHONY: ubuntu

IMAGENAME=docker-image-resource-arm64
ubuntu: dockerfiles/ubuntu-arm64/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):ubuntu

.PHONY: alpine

alpine: dockerfiles/alpine-arm64/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):alpine

.PHONY: push

push: ubuntu alpine
	docker push ebilling/$(IMAGENAME):ubuntu
	docker push ebilling/$(IMAGENAME):alpine

