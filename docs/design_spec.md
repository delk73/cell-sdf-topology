# Cell SDF Topology – Design Spec

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
- Each cell identity tracked as a soft field I_i(x,t).
- World-tubes represent continuous life histories.
- Division -> tube splits; fusion -> tubes merge.
- Timing is determined by persistence of topological change and operator schedules (s(t)).

## Storage Model and API
- **Geometry**: base SDF, operator params, event schedules.
- **Signals**: curve data with keyframe/deltas.
- **Lineage**: identity schedules.
- APIs: reconstruct voxel subvolumes, query surfaces, fetch signals, export lineage.

## Operator-ID Pipeline (Compute)

- The database serves as a **catalog and scheduler**: it stores operator definitions, parameters, and lineage graphs, and responds to lightweight lookup queries.
- It is **not used for heavy numerical analytics** (joins, group-bys, aggregations). All field evaluation, topology application, and signal reconstruction happens in the executor.
- **Server sends IDs of cached operators, not bulk data**.
- Client resolves operator IDs to known kernels and executes them locally (WebGPU or CUDA).
- Execution is client-preferred, but the same operator IDs can also be dispatched to backend containers (e.g. Labs) for reproducibility, heavy batch jobs, or environments without GPU-enabled clients.
- Payloads are minimal: operator ID + parameters + composition graph.

### Benefits
- **Cost savings**: expensive SQL compute avoided; backend acts as a metadata catalog, not a math engine.
- **Scalability**: client GPUs absorb the heavy computations.
- **Composability**: operator pipelines can be built and re-used locally.
- **Caching**: once an operator is present, future recipes cost nearly zero to transmit.


Example recipe payload:
```json
{
  "pipeline_id": "123e4567",
  "operators": [
    {"id": "sphere_r3"},
    {"id": "tube_l10_r1"}
  ],
  "composition": [
    {"from": "sphere_r3", "to": "tube_l10_r1", "op": "merge"}
  ]
}
```

## Audit and Discovery

* **Quality gates**: Hausdorff error < threshold, eikonal regularity, locality checks.
* **Provenance**: each value labeled as measured/interpolated/extrapolated.
* **Residuals**: systematic mismatches flagged as novelty -> candidate new operators.
* **Persistence windows**: events must persist across time *and* space beyond noise thresholds before being recorded as true topological changes.

---

## Related Patterns

The Operator-ID Pipeline builds on familiar patterns in computing, but applies them to
SDF-based cell topology and lineage modeling.

- **Relational Catalogs**  
  SQL is used as a lightweight catalog: storing operator definitions, parameters, and lineage graphs.  
  This mirrors long-standing practice where databases serve as the *system of record*, while
  actual compute is performed in application code.

- **Shader / Operator Catalogs in Graphics**  
  Game and rendering engines keep symbolic shader/operator definitions and push the heavy lifting
  to the GPU. Our approach follows this lineage: operator IDs describe *what* to compute, while
  the client GPU decides *how* to compute.

- **Workflow DAGs (Spark, TensorFlow, etc.)**  
  Large-scale compute frameworks represent pipelines as directed acyclic graphs of operators,
  with executors scheduled elsewhere. Here, each client GPU serves as the executor, applying
  SDF operators locally in real time.

- **Vector Databases (offspoke)**  
  High-dimensional embeddings can be attached to operators or recipes for similarity search,
  clustering, or novelty detection. These embeddings are *derived indexes*, always re-generable
  from the symbolic catalog, never the source of truth.

**Key distinction:**  
The SQL catalog remains the single source of truth (SSOT).  
Vector indexes, operator embeddings, and lineage graphs are *offspokes*—helpful for discovery and
analysis, but always rebuildable from the catalog. Heavy numerical compute (field evaluation,
topology changes, signal reconstruction) is offloaded to the client GPU.

## Note on Parallel Development with SDFK

The concepts in Cell SDF Topology run in parallel with work on the **Synesthetic Framework (SDFK)**.  
- Current v0.7.3 demos (visual shaders, perception schemas) are expressed in **disjointed JSON** and are not operator-compliant. These serve as mock-ups for illustrating topology ideas in a perceptual medium.  
- SDFK v1.0 will migrate to a fully **operator-based model**, aligned with the Operator-ID Pipeline described here. At that point, both biology (cell topology) and perception (synesthetic schemas) will share the same operator catalog and execution backend.

https://github.com/delk73/synesthetic-schemas



