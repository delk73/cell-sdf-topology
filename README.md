# cell-sdf-topology

> **Time-conditioned signed distance fields (SDFs)** as continuous geometric records of living form - representing cells, their shape changes, and attached signals as unified *world-tubes* through time.

**cell-sdf-topology** explores how change can be represented not as a sequence of moments, but as a single continuous shape that exists *through time*.

It serves as a research sandbox for **time-conditioned signed distance fields (SDFs)** - a way of treating both form and evolution as a unified field, suitable for representing cells, topology-changing processes, and attached signals.

---

## Concept

A signed distance field describes where a surface exists in space.
If we add time as another dimension and let the SDF evolve through it, the shape doesn't just *move* - it *extrudes* through time.

That extrusion forms a continuous "tube" in space-time:

* Each time slice shows the shape's boundary.
* The full tube shows how that boundary deforms, divides, merges, or dissolves.

This is the **world-tube** - a smooth geometric object that contains the entire history of a shape.
What once was animation becomes topology.

---

## Dimensional Analogy

| Spatial Dim                      | Extruded Form                | Physical Meaning                                                            | Biological Analogy                                                                                                                                                               |
| -------------------------------- | ---------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **0D (a point)**                 | **1D world-line**            | A particle’s position traced through time                                   | A single molecule or ion’s trajectory — diffusion path of one signaling molecule                                                                                                 |
| **1D (a curve)**                 | **2D world-sheet**           | A filament’s deformation through time                                       | A cytoskeletal filament (e.g., actin, microtubule) growing, bending, and remodeling through time                                                                                 |
| **2D (a surface)**               | **3D world-tube**            | A membrane or boundary evolving through time                                | A cell membrane undergoing division, migration, or morphogenesis — its “world-tube” represents the full motion and shape evolution of that cell                                  |
| **3D (a volume)**                | **4D world hyper-tube**      | A volumetric body evolving through time                                     | A full cell or multicellular organism’s 4D life history — capturing both morphology and state transitions across its lifespan                                                    |
| **4D (a hyper-volume)**          | **5D evolutionary manifold** | The space of all possible histories — how rules of change themselves evolve | Lineage and evolutionary processes: developmental programs, gene networks, and morphogenetic constraints shifting across generations                                             |
| **5D (a manifold of histories)** | **6D entangled field-space** | Interacting systems of evolving manifolds — coupling across histories       | Ecosystem- or biosphere-scale coupling: co-evolving species, metabolic and environmental feedbacks, where the “field” of life’s coherence spans multiple interacting world-tubes |

Each new dimension "blooms" the representation - adding another axis of experience.
The tube describes not only where something *is*, but also where it *has been* and *is becoming*.

---


## Relation to Synesthetic OS

This repository is part of the broader **Synesthetic OS** ecosystem.
It focuses on **operator-level research** - developing the mathematical and geometric foundations before they are promoted into production schemas.

* **Use cases** (controls, perceptual field mapping, topology) are defined and versioned in [`synesthetic-schemas`](https://github.com/delk73/synesthetic-schemas).
* **Platform integration** occurs in [`sdfk`](https://github.com/delk73/sdfk), where validated operators become schema-backed controls and interactive elements.
* **This repository** isolates the experimental stage - exploring **world-tubes**, **cellular packing**, **hyperspectral overlaps**, and other constructs.

When an operator here proves stable and broadly useful, it is **graduated into `synesthetic-schemas`** and used within the Synesthetic OS runtime.

---

## Why This Repository Exists

Most bioimaging pipelines are **voxel-centric** (OME-NGFF, HDF5, segmentation masks) or **mesh-centric** (surface triangulations).
They store massive arrays or polygon soups that are:

* Heavy to store and stream.
* Hard to compare or search.
* Poor at handling topological events (division, fusion, blebbing).

This project takes a different path:

* **SDF-first** - geometry defined as functions, not voxel blobs.
* **Operator catalog** - reusable primitives (division, fusion, ripple, bleb, neck) fit from voxel data.
* **Residuals as discovery** - systematic errors become signals for new operators.
* **Lineage as world-tubes** - continuous identity functions across time, not ad hoc IDs.
* **Signals anchored** - spectral or temporal curves tied directly to surfaces or regions in the SDF.

---

## Positioning: SDF-First vs. Voxel/Mesh

Unlike voxel or mesh storage, which **freeze** data as arrays or polygons, the SDF-first approach treats geometry as a **function**.

This enables:

* Compact storage (parameters, not pixels).
* Natural handling of topological changes (splits, merges, blebs).
* Direct attachment of signals and lineage without lossy conversions.
* Residuals that surface *new biology* instead of being discarded as error.

---

## Why This Approach

* **Continuity** - no discrete frames; motion and form are one object.
* **Physical fidelity** - time is built into the geometry, not sampled afterward.
* **Analytical depth** - curvature and derivatives reveal motion and growth rates.
* **Extensibility** - the model can "bloom" beyond time to include chemical, acoustic, or perceptual fields.

-

## Getting Started

1. Clone the repository.
2. Explore basic SDF constructions under `examples/`.
3. Apply temporal extrusion to any static field.
4. Visualize slices to see the cell's evolution embedded in space-time.

-

## Future Directions

* Coupling morphology with reaction-diffusion or signaling fields.
* Learning world-tubes from microscopy or simulation data.
* Rendering and slicing 4D+ manifolds interactively.
* Quantifying topological events: division, fusion, collapse.

-

## Inspiration

This project grew from thinking about how living forms persist and change - not as snapshots or keyframes, but as continuous processes that leave a trace through time.
In biology and physics alike, every object has a *world-line*: a record of where it has been.
Here, that idea is extended to complex spatial fields - giving each cell, surface, or volume a **world-tube**, a tangible geometric history.

It is a way to see structure and motion as one: to study evolution, interaction, and morphogenesis through a single, unbroken field.

-

## Philosophical Grounding: The Geometry of Perception

This project begins from a simple but far-reaching intuition:
that **time-conditioned signed distance fields (SDFs)** may not only describe how living forms evolve,
but also reflect the deeper **geometry through which perception itself is organized**.

While the immediate application is biological modeling, the broader hypothesis is that the brain represents the world - and generates experience - through a similar field-based formalism.
This perspective connects computational geometry with long-standing questions in neuroscience and the philosophy of mind:

* **Continuity of Experience** - Perception feels continuous, not frame-based.
  The world-tube formalism mirrors this: a single manifold where motion and form are unified aspects of one continuous field.

* **The Binding Problem** - How disparate sensory inputs become a coherent percept.
  In this model, binding is intrinsic: each sensory modality ($color(x,t)$, $sound(x,t)$) is simply a field anchored to the same manifold $f(x,t)=0$.
  The object is the geometry itself; its attributes are functions defined upon it.

* **The "Thick" Present** - Our sense of *now* includes traces of the past and anticipations of the near future.
  The temporal derivatives of $f$ encode these dynamics directly:
  $\partial f / \partial t$ corresponds to perceived motion; higher-order terms represent momentum, persistence, and prediction.

* **Predictive Processing Substrate** - Instead of storing voxel snapshots, a perceptual system could maintain compact parameters of a world-tube, updating it continuously by minimizing prediction error.

### Formal Analogy

| SDF World-Tube Construct                                       | Proposed Perceptual Analog                               |
| - | - |
| The manifold $f(x, y, z, t) = 0$                               | The unified field of awareness - the stage of experience |
| Spatial gradients $\nabla_{xyz} f$                             | Perception of static form and structure                  |
| Temporal gradient $\partial f / \partial t$                    | Direct perception of motion and flow                     |
| Higher-order derivatives $\partial^2 f / \partial t^2, \ldots$ | Felt momentum, anticipation, surprise                    |
| Anchored signal fields (e.g. $color(x,t)$)                     | Sensory qualities - color, sound, texture                |
| Topological events (splits, merges)                            | Perceived discrete events: creation, fusion, division    |

In this view, perception is not a sequence of frames but a **continuous manifold** - a standing geometric object through which consciousness moves.
The apparent "flow of time" is the traversal of that manifold's temporal axis.

This section defines the **conceptual horizon** for the project:
to develop a formal geometry capable of describing not only how cells exist and transform in time,
but how perception itself might arise from such transformations.

-

## Limits of Representation: The Observation Dimension

Every system that seeks to represent its own evolution encounters a structural boundary.
In logic, Godel's incompleteness theorems show that any consistent formal system rich enough to describe arithmetic contains true statements that cannot be proven within it.
**By analogy**, a geometric system that encodes its own temporal evolution faces a comparable limit.

A time-conditioned signed distance field $f(\mathbf{x}, t)$ that captures all change necessarily embeds its own dynamics.
Such a field cannot simultaneously contain the *perspective* from which it is observed - that perspective lies in an additional, unmodeled dimension we call the **Observation Dimension**.

| Element                               | Logical Analog       | Meaning                                 |
| - | - | - |
| The SDF manifold $f(\mathbf{x}, t)=0$ | Formal system        | The complete set of describable states  |
| Residuals or unfit data               | Godel sentences      | Truths the current basis cannot express |
| New operators or fields               | Axiomatic extensions | Expanding expressivity without closure  |

Completeness in this context is **asymptotic**:
each new operator expands what can be represented, but a remainder always persists - phenomena just beyond the expressible basis.
Those residuals are not errors; they mark the **discovery frontier** - the surfaces where new operators and new couplings emerge.

Recognizing this limit keeps the framework honest: the SDF is not the world itself,
but the best self-consistent slice of it that can be held inside geometry.

-

## Repository Structure

* `docs/` - **SSOT design**: specifications, operator catalog, audit methods, and open questions.
* `docs/primer.md` - **Primer**: a plain-language bridge between cell biology terms and SDF operators/workflows.
* `meta/prompts/` - **Provenance**: `init/`, `emit/`, and `audit/` prompts with heredocs.
* `src/` - **Future code**: stubs for fitting, reconstruction, and APIs.
* `tests/` - **Test harness**: placeholders targeting Python >=3.11 with `pytest`.
* `meta/outputs/` - **Audit outputs**: reports and verification artifacts.

-

## Status

* Initialization, emission, and audit loops complete.
* Documentation passes audit.
* Ready for public release as a reference repository.

--

## License & Citation

* License: MIT.
* Cite via `CITATION.cff` (GitHub will generate BibTeX/APA automatically).

For related work on time-conditioned SDFs via neural representations, see Wiesner et al., 2023.
