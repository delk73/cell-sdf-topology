# Cell SDF Topology

**Cell SDF Topology** is a research repo exploring **time-conditioned signed distance fields (SDFs)** as the **single source of truth (SSOT)** for representing cells, their topology-changing processes, and attached signals.

## Why this repo exists

Most bioimaging pipelines are **voxel-centric** (OME-NGFF, HDF5, segmentation masks) or **mesh-centric** (surface triangulations). They store massive arrays or polygon soups that are:

* Heavy to store and stream.
* Hard to compare or search.
* Poor at handling topological events (division, fusion, blebbing).

This repo takes a different path:

* **SDF-first**: geometry defined as programs, not voxel blobs.
* **Operator catalog**: reusable primitives (division, fusion, ripple, bleb, neck) fit from voxel data.
* **Residuals as discovery**: systematic errors become signals for new operators.
* **Lineage as world-tubes**: continuous identity functions across time, not ad-hoc IDs.
* **Signals anchored**: curves (spectral, temporal) tied directly to surfaces/regions in the SDF.

## Positioning: SDF-first vs. voxel/mesh

Unlike voxel or mesh storage, which **freeze data as heavy arrays or polygons**, the SDF-first approach treats geometry as a **function**.  
This enables:

* Compact storage (parameters, not pixels).
* Natural handling of topological changes (splits, merges, blebs).
* Direct attachment of signals and lineage without lossy conversions.
* Residuals that surface *new biology* instead of being discarded as error.

## Repo Structure

* `docs/` - **SSOT design**: specs, operator catalog, audit methods, open questions.
* `docs/primer.md` - **Primer**: plain-language bridge between cell biology terms and SDF operators/workflows.
* `meta/prompts/` - **Provenance**: `init/`, `emit/`, `audit/` prompts with heredocs.
* `src/` - **Future code**: stubs for fitting, reconstruction, and APIs.
* `tests/` - **Test harness**: currently placeholders, target Python ≥3.11 with `pytest`.
* `meta/outputs/` - **Audit outputs**: reports and verification artifacts.

## Status

* Init, emit, and audit loops complete.
* Docs pass audit.
* Ready for public release as a reference repo.

## License & Citation

* License: MIT.
* Cite via `CITATION.cff` (GitHub will generate BibTeX/APA automatically).
