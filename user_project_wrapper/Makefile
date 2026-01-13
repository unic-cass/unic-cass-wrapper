TOP = user_project_wrapper
TAG = $(TOP)_tag
PROJECT_DIR = ../
LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane
PDK_ROOT = $(PROJECT_DIR)/IHP-Open-PDK

CONFIG_FILE = $(PROJECT_DIR)/$(TOP)/config.json

librelane: final/gds/$(TOP).gds
.PHONY: librelane

final/gds/$(TOP).gds:
	# Run librelane to generate the layout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --run-tag $(TAG) --overwrite --manual-pdk $(CONFIG_FILE)"

	# copy final results to top directory
	rm -rf $(PROJECT_DIR)/$(TOP)/final
	cp -r $(PROJECT_DIR)/$(TOP)/runs/$(TAG)/final $(PROJECT_DIR)/$(TOP)

view_results: 
	# View the results in KLayout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --last-run --manual-pdk $(CONFIG_FILE) --flow OpenInOpenROAD"