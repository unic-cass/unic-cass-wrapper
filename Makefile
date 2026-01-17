PROJECT_DIR = $(shell pwd)
LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane

.PHONY: setup
setup:
	git submodule update --init --recursive

.PHONY: copy_results
copy_results:
	cp -r unic_cass_wrapper/final final/