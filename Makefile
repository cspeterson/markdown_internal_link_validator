SHELL=/bin/bash -O globstar -c
GID := $(shell id --group)
UID := $(shell id --user)


all: shunit2


docker-build:
	# Build the docker image for testing the code
	docker build --tag markdown_internal_link_validator .

docker-tests:
	@docker run --interactive --tty --mount type=bind,source="$(PWD)",target=/src --user=$(UID):$(GID) markdown_internal_link_validator tests

tests:
	# Run test suite
	test/unit_tests
