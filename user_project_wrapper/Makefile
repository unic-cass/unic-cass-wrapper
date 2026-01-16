TOP = user_project_wrapper
TAG = $(TOP)_tag
PROJECT_DIR = ../
LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane
PDK_ROOT = $(PROJECT_DIR)/IHP-Open-PDK
PDK=ihp-sg13g2

CONFIG_FILE = $(PROJECT_DIR)/$(TOP)/config.json

.PHONY: all
all: librelane klayout-drc

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

.PHONY: klayout-drc
klayout-drc:
	# Run KLayout DRC on the generated GDS
	nix-shell --pure $(LIBRELANE_DIR) --run "python3 $(PDK_ROOT)/$(PDK)/libs.tech/klayout/tech/drc/run_drc.py --path $(PROJECT_DIR)/$(TOP)/final/gds/$(TOP).gds --run_mode=deep --disable_extra_rules --no_density --run_dir $(PROJECT_DIR)/$(TOP)/final/klayout_drc/klayout_drc_report.log"