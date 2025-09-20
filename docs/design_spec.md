# Cell SDF Topology - Design Spec

## Introduction
This document is the single source of truth (SSOT) for the **Cell SDF Topology** research project. It describes how time-conditioned signed distance fields (SDFs) can represent cell surfaces, including processes that change topology over time (division, fusion, etc.).

## Core Paradigm: SDF as SSOT
- Geometry represented as **F(x,y,z,t)**.
- Voxel volumes are derived, not stored.
- Signals and lineage attach to surfaces defined by F.

## Topological Operators
- Operators are defined and refined through fitting against voxel data.
- Known primitives: division, fusion, protrusion/blebs, ruffling, rounding.
- Catalog is data-driven: residual errors surface new operator archetypes.

## Signal Model
- Signals anchored at surfaces and regions (membrane, cytosol, nucleus).
- Stored as curves (time series + spectra).
- Patch model: keyframes + deltas with provenance tags.

## Lineage Model: Identities and World-Tubes
- Each cell identity tracked as a soft field Ii(x,t).
- World-tubes represent continuous life histories.
- Division -> tube splits; fusion -> tubes merge.
- Timing is determined by persistence of topological change and operator schedules (s(t)).

## Storage Model and API
- **Geometry**: base SDF, operator params, event schedules.
- **Signals**: curve data with keyframe/deltas.
- **Lineage**: identity schedules.
- APIs: reconstruct voxel subvolumes, query surfaces, fetch signals, export lineage.

## Audit and Discovery
- **Quality gates**: Hausdorff error < threshold, eikonal regularity, locality checks.
- **Provenance**: each value labeled as measured/interpolated/extrapolated.
- **Residuals**: systematic mismatches flagged as novelty -> candidate new operators.
