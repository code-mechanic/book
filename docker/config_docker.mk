DOCKER_IMG        := ghcr.io/code-mechanic/book
DOCKER_VERSION    := latest
DOCKER_PATH       := $(DOCKER_IMG):$(DOCKER_VERSION)
CONTAINER         := book_builder
ROOT_DIR          := /home/book
MCU_BRIDGE_PATH   := $(ROOT_DIR)
QUIET             := >/dev/null 2>&1
LOCAL_UID         ?= $(shell id -u)
LOCAL_GID         ?= $(shell id -g)

# Run commands in the local docker container if not in said container
# On Windows, you must use PowerShell or some environment that supports `which`
# or always run in Docker
ifeq (, $(shell which docker))
  DOCKER :=
else
  DOCKER := docker exec --user $(LOCAL_UID):$(LOCAL_GID) --env HOME=/tmp $(CONTAINER)
endif
