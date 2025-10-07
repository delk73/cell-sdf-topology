# cell-sdf-topology

> **Time-conditioned signed distance fields (SDFs)** as continuous geometric records of living form — representing cells, their shape changes, and attached signals as unified *world-tubes* through time.

**cell-sdf-topology** explores how change can be represented not as a sequence of moments, but as a single continuous shape that exists *through time*.  

It is a research sandbox for **time-conditioned signed distance fields (SDFs)** — a way of treating both form and evolution as a unified field, suitable for representing cells, topology-changing processes, and attached signals.

---

## 🌱 Concept

A signed distance field describes where a surface is in space.  
If we add time as another dimension and let the SDF evolve through it, the shape doesn’t just *move* — it *extrudes* through time.

That extrusion forms a continuous “tube” in space-time:
- Each time slice shows the shape’s boundary.  
- The full tube shows how that boundary deforms, divides, merges, or dissolves.

This is the **world-tube** — a smooth geometric object that contains the entire history of a shape.  
What used to be animation becomes topology.

---

## 🌀 Dimensional analogy

| Spatial Dim    | Extruded Form       | Meaning                                   |
| -------------- | ------------------- | ----------------------------------------- |
| 0D (a point)   | 1D world-line       | a moving point’s trace                    |
| 1D (a curve)   | 2D world-sheet      | a deforming curve through time            |
| 2D (a surface) | 3D world-tube       | a deforming boundary through time         |
| 3D (a volume)  | 4D world hyper-tube | a living volume’s full temporal evolution |
...

---

## 🔍 Mathematical form

Let \( f(\mathbf{x}, t) \) be the signed distance field,  
where \(\mathbf{x} \in \mathbb{R}^N\) and \(t\) is time.  

The zero level set \( f(\mathbf{x}, t) = 0 \) defines the boundary of the shape at each moment.  
The union of all such boundaries forms a manifold in \((N+1)\)-dimensional space —  
the **world-tube**, or **world-volume** in higher dimensions.  

Spatial gradients describe surface normals; temporal gradients describe motion.  
Curvature along time encodes persistence and velocity.

---

## 🔬 Relation to Synesthetic OS

This repository is part of the broader **Synesthetic OS** ecosystem.  
It focuses on **operator-level research** — developing the mathematical and geometric foundations before they are promoted into production schemas.

- **Use cases** (controls, perceptual field mapping, topology) are defined and versioned in [`synesthetic-schemas`](https://github.com/delk73/synesthetic-schemas).  
- **Platform integration** happens in [`sdfk`](https://github.com/delk73/sdfk), where validated operators become schema-backed controls and interactive elements.  
- **This repo** isolates the experimental stage — exploring **world-tubes**, **cellular packing**, **hyperspectral overlaps**, and other constructs.

When an operator here proves stable and broadly useful, it is **graduated into `synesthetic-schemas`** and used within the Synesthetic OS runtime.

---

## 🧩 Why this repo exists

Most bioimaging pipelines are **voxel-centric** (OME-NGFF, HDF5, segmentation masks) or **mesh-centric** (surface triangulations).  
They store massive arrays or polygon soups that are:

* Heavy to store and stream.  
* Hard to compare or search.  
* Poor at handling topological events (division, fusion, blebbing).  

This project takes a different path:

* **SDF-first** — geometry defined as functions, not voxel blobs.  
* **Operator catalog** — reusable primitives (division, fusion, ripple, bleb, neck) fit from voxel data.  
* **Residuals as discovery** — systematic errors become signals for new operators.  
* **Lineage as world-tubes** — continuous identity functions across time, not ad-hoc IDs.  
* **Signals anchored** — spectral or temporal curves tied directly to surfaces/regions in the SDF.

---

## ⚖️ Positioning: SDF-first vs. voxel/mesh

Unlike voxel or mesh storage, which **freeze** data as arrays or polygons, the SDF-first approach treats geometry as a **function**.  

This enables:
- Compact storage (parameters, not pixels).  
- Natural handling of topological changes (splits, merges, blebs).  
- Direct attachment of signals and lineage without lossy conversions.  
- Residuals that surface *new biology* instead of being discarded as error.

---

## ✴️ Why this approach

- **Continuity** — no discrete frames; motion and form are one object.  
- **Physical fidelity** — time is part of the geometry, not sampled after the fact.  
- **Analytical depth** — curvature and derivatives reveal motion and growth rates.  
- **Extensibility** — the model can “bloom” beyond time to include chemical, acoustic, or perceptual fields.

---

## 🔧 Getting started

1. Clone the repository.  
2. Explore basic SDF constructions under `examples/`.  
3. Apply temporal extrusion to any static field.  
4. Visualize slices to see the cell’s evolution embedded in space-time.

---

## 🔭 Future directions

- Coupling morphology with reaction–diffusion or signaling fields.  
- Learning world-tubes from microscopy or simulation data.  
- Rendering and slicing 4D+ manifolds interactively.  
- Quantifying topological events: division, fusion, collapse.

---

## 📁 Repo Structure

* `docs/` — **SSOT design**: specs, operator catalog, audit methods, open questions.  
* `docs/primer.md` — **Primer**: plain-language bridge between cell biology terms and SDF operators/workflows.  
* `meta/prompts/` — **Provenance**: `init/`, `emit/`, `audit/` prompts with heredocs.  
* `src/` — **Future code**: stubs for fitting, reconstruction, and APIs.  
* `tests/` — **Test harness**: currently placeholders, target Python ≥3.11 with `pytest`.  
* `meta/outputs/` — **Audit outputs**: reports and verification artifacts.

---

## 📈 Status

* Init, emit, and audit loops complete.  
* Docs pass audit.  
* Ready for public release as a reference repo.

---

## ⚖️ License & Citation

* License: MIT.  
* Cite via `CITATION.cff` (GitHub will generate BibTeX/APA automatically).

---

## 🌍 Inspiration

This project grew from thinking about how living forms persist and change — not as snapshots or keyframes, but as continuous processes that leave a trace through time.  
In biology and physics alike, every object has a *world-line*: a record of where it has been.  
Here, that idea is extended to complex spatial fields — giving each cell, surface, or volume a **world-tube**, a tangible geometric history.

It’s a way to see structure and motion as one thing — to study evolution, interaction, and morphogenesis through a single unbroken field.
