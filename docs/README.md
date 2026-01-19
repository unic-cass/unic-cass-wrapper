[![Librelane Digital Flow (UNIC-CASS)](https://github.com/unic-cass/unic-cass-wrapper/actions/workflows/digital-flow.yaml/badge.svg?branch=dev&event=push)](https://github.com/unic-cass/unic-cass-wrapper/actions/workflows/digital-flow.yaml)

# UNIC-CASS-WRAPPER 

> **Project Status:**
>This repository represents an initial version of the UNIC-CASS Wrapper. Its architecture, interfaces, and integration assumptions may evolve over time as the UNIC-CASS program grows and new requirements, design experiences, and use cases are incorporated.

Table of contents
=================

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Quick Start](#quick-start)

Overview
========

The UNIC-CASS Wrapper is an open-source chip integration template designed to standardize and simplify the integration of UNIC-CASS circuit designs for fabrication using the IHP open-source PDK.

Inspired by the Caravel integration concept, this repository provides a lightweight wrapper architecture that enables designers to focus on their core circuit designs while relying on a predefined, reusable top-level structure for chip-level integration. Unlike Caravel, the UNIC-CASS Wrapper does not implement a System-on-Chip (SoC); instead, it serves purely as a generic template for integrating one or more user designs into a manufacturable chip.

This repository is part of the Universalization of IC Design from CASS (UNIC-CASS) program—an open, end-to-end initiative aimed at democratizing integrated circuit design education and fabrication through open-source tools, workflows, and PDKs.

Architecture
============

Quick Start
===========

### Starting Your Project

1. Create a new repository based on the unic-cass-wrapper template. Ensure your repo is public and includes a README.
    - Follow [this link](https://github.com/unic-cass/unic-cass-wrapper/fork) to create your repository.
    - Clone the repository using:
        ```
        git clone <your GitHub repo URL>
        ```
2. Set up your local environment:
    ```
    cd <project_name>
    make setup
    ```
    This command installs:
    1. Submodules
3. Start hardening your design:
    - Create a subdirectory for each macro in your project under the unic_cass_user_project/ directory with Librelane configuration files.
    - Provide an RTL Verilog model of your design to Librelane.
        ```
        cd unic_cass_wrapper_user_project
        make <module_name>
        ```
4. Integrate modules into the user_project_wrapper:
    1. Instantiate your module(s) in verilog/rtl/user_project_wrapper.v.
    2. Update the macros in the unic_cass_wrapper/config.json file. Make sure to provide:
        - your design names
        - GDS path
        - LEF path
        - NL (netlist) path
        - LIB path
        - SPEF path
        - Module instances with the desired position
    3. Harden the user_project_wrapper with your module(s):
        ```
        cd unic_cass_wrapper
        make
        ```
5. After you have gone through the flow successfully, update the "designs" variable in the Makefile of the main directory and run it. This will:
    1. Run again the complete flow.
    2. If it passes DRC and LVS it is ready for tapeout.
6. This main Makefile will be run in github every time you push a change. The action must pass in order to complete the mock-tapeout process.
