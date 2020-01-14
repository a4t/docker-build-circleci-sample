DOCKER_USER=$(shell cat .env | grep DOCKER_USER)
DOCKER_PASS=$(shell cat .env | grep DOCKER_PASS)

local-ci:
	circleci config process .circleci/config.yml > .circleci/process.yml
	circleci local execute \
		-c .circleci/process.yml \
		-e FULL_IMAGE_NAME="iwanomoto/docker-build-circleci-sample" \
		-e ${DOCKER_USER} \
		-e ${DOCKER_PASS} \
		--job push
