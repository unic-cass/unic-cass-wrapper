# UNIC-CASS-WRAPPER 

>**Project Status:**
>This repository represents an initial version of the UNIC-CASS Wrapper. Its architecture, interfaces, and integration assumptions may evolve over time as the UNIC-CASS program grows and new requirements, design experiences, and use cases are incorporated.

Table of contents
=================

1. [Overview](#overview)

Overview
========

The UNIC-CASS Wrapper is an open-source chip integration template designed to standardize and simplify the integration of UNIC-CASS circuit designs for fabrication using the IHP open-source PDK.

Inspired by the Caravel integration concept, this repository provides a lightweight wrapper architecture that enables designers to focus on their core circuit designs while relying on a predefined, reusable top-level structure for chip-level integration. Unlike Caravel, the UNIC-CASS Wrapper does not implement a System-on-Chip (SoC); instead, it serves purely as a generic template for integrating one or more user designs into a manufacturable chip.

This repository is part of the Universalization of IC Design from CASS (UNIC-CASS) program—an open, end-to-end initiative aimed at democratizing integrated circuit design education and fabrication through open-source tools, workflows, and PDKs.