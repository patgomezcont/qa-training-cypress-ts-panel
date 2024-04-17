default: docker-tests

# Local commands
dependencies:
	npm i

.PHONY: tests
tests:
	npm test

.PHONY: tests-run
tests-run:
	npm run test:run

.PHONY: unit-test
unit-test:
	npm run unit

unit-coverage:
	npm run unit:coverage

# Docker commands
docker-build:
	@docker build -t codiumteam/qa-cypress-js .

docker-tests:
	@ xhost + >/dev/null 2>&1 || true
	@ docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e CYPRESS_NO_COMMAND_LOG=1 -e DISPLAY -v ${PWD}:/code --entrypoint cypress codiumteam/qa-cypress-js open --project . --e2e 
	@ xhost - >/dev/null 2>&1 || true

docker-tests-run:
	@ xhost + >/dev/null 2>&1 || true
	@ docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e CYPRESS_NO_COMMAND_LOG=1 -e DISPLAY -v ${PWD}:/code codiumteam/qa-cypress-js 
	@ xhost - >/dev/null 2>&1 || true
