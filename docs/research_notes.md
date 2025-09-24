# Research Notes: Cellular & Topological SDF Operators

**Version:** Draft v0.1  
**Owner:** delk73  
**Last Reviewed:** 2025-09-24

---

## Motivation

The `cell-sdf-topology` repository exists to investigate **cellular and topological extensions of SDF operators**.  
While `sdfk` provides the PoC platform and `synesthetic-schemas` captures canonical use cases, this repo is the **R&D layer**:  
a space to test novel operators, parameterizations, and curve behaviors before schema formalization.

---

## Research Focus

- **World-Tube Operators**  
  Continuous structures representing trajectories or temporal "tubes" in SDF space. Useful for visualizing or constraining field dynamics.

- **Cellular Packing & Topology**  
  Operators for tiling, packing, or subdividing space in ways that respect perceptual or physical constraints.

- **Hyperspectral Overlap**  
  Mapping multiple parameter spaces (visual, audio, haptic) onto shared SDF fields to explore interdependence.

---

## Role in Synesthetic System

- **Here**: Prototype operators, explore math, run sweeps.  
- **Schemas (`synesthetic-schemas`)**: Define and stabilize use cases.  
- **Platform (`sdfk`)**: Implement schema-backed operators as controls and interactive perceptual tools.  

This repo is intentionally **narrow in scope**:  
documented exploration + operator prototypes → promotion path → schema integration → platform adoption.