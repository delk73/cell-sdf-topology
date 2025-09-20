# Primer - Cell SDF Topology

This primer explains the biology terms and how they map to our **SDF-first** approach in plain language.

## Core idea
- **SDF-first:** represent a cell surface by a function that returns distance to the surface, not by voxel blobs or polygon meshes.
- **Time-conditioned:** the function depends on time, so shapes change smoothly.
- **Operators:** small, reusable shape changes (division, fusion, bleb, ruffle…) we **fit to data**.
- **Residuals:** where the fit is consistently bad, we treat that error as **discovery signal** for new operators.
- **World-tubes (lineage):** identities tracked as continuous tubes through spacetime; splits/merges are events, not file forks.
- **Signals anchored:** intensities/spectra sampled at consistent offsets from the surface, so curves are comparable across cells and time.

## Biology ↔ Operator mapping (quick guide)

| Term | Plain meaning | In data | SDF operator idea | Fit notes |
|---|---|---|---|---|
| **Blebbing** | Round blister on membrane | Smooth cap with narrow neck | Local lobe (soft-union) + neck constraint | Fit Gaussian-like lobe: position, width, amplitude; enforce min neck radius. |
| **Ruffling** | Wavy ripples at an edge | Repeating ridges | Sinusoidal offset along tangent frame | Detect periodic curvature; smaller amp than blebs. |
| **Lamellipodium** | Thin sheet-like extension | Broad flat flange | Anisotropic offset + taper | Thickness ≪ lateral extent; may co-occur with ruffles. |
| **Filopodia** | Thin spikes | Long slender protrusions | Slender rod union (centerline + radius) | High aspect ratio; require temporal persistence. |
| **Mitotic rounding** | Cell rounds before division | Global smoothing | Isotropic scale deformation | Often precedes cleavage; do not call division yet. |
| **Cleavage furrow (division)** | Constriction that splits one cell into two | Saddle-like groove deepening | Soft-difference along plane/curved plane + depth schedule | Commit split when topology separates and **persists**. |
| **Fusion / neck** | Two cells connect/merge | Hourglass throat that thickens | Soft-union with throat (centerline + radius profile) | Commit merge when components become one and persist. |
| **Budding** | Daughter sprouts then pinches | Small lobe grows then splits | Local lobe + neck → eventual division | Monotonic growth to scission. |

## Fitting workflow (no math)
1) **Start from voxels:** denoise → boundary likelihood → initial SDF.
2) **Propose operators** in candidate regions (bulge, ripple, neck…).
3) **Fit smallest operator** that explains the change (few parameters).
4) **Check persistence** over a short time window before committing events.
5) **Record parameters** (positions, sizes, schedules) instead of big volumes.
6) **Compute residuals** (mismatch map near the surface). Persistent clusters → candidate new operator types.

## Lineage as world-tubes
- Each identity is a soft ownership field over space-time → a **tube**.
- **Split:** when the surface truly breaks into two and the change persists, fork the tube (parent → children).
- **Merge:** when two surfaces become one and persist, merge tubes.
- Geometry SSOT stays one function; lineage is an overlay tied to event schedules.

## Signals anchored to surfaces/regions
- Sample at consistent offsets from the SDF zero-level (e.g., -100 nm, 0, +200 nm).
- Attach curves (temporal/spectral) to regions (membrane, cortex, cytosol).
- Same rule → comparable curves across cells and time, independent of raw voxel resolution.

## Storage & search (later work)
- **SSOT (structured):** base SDF, fitted operator params, schedules, lineage, and signal attachments (Postgres/JSONB or similar).
- **Vector index (derived):** embeddings for similarity search (operator params, curve descriptors, lineage patterns) in FAISS/pgvector/Milvus.
- Keep the vector index **derivative** so SSOT remains minimal and auditable.

## Residuals as discovery
- After every fit, compute mismatch near the surface.
- Random noise → ignore. **Persistent clusters** → propose a new operator archetype.
- This is how the catalog grows from real data, not hand-waving.

## Minimal mental model
- **Cells are programs:** base shape + a few timed operators.
- **Events are schedules:** small timelines (onset, growth, decay) per operator.
- **IDs ride on top:** lineage labels tied to actual surface change.
- **Signals follow the surface:** always sampled the same way relative to the SDF.

## Glossary (one-liners)
- **SDF:** function giving signed distance to a surface (negative inside, positive outside).
- **Operator:** reusable, parameterized shape change (e.g., lobe, ripple, furrow, neck).
- **Schedule:** time program (0→1) controlling an operator's strength.
- **World-tube:** a cell's continuous identity in (x,y,z,t), used for lineage.
- **Residual:** remaining mismatch after fitting; used for QC and discovery.
