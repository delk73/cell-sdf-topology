# Primer — Cell SDF Topology

## Context and Reference

**Wiesner, D. et al. (2023).** *Generative Modeling of Living Cells with SO(3)-Equivariant Implicit Neural Representations.*
*Medical Image Analysis.* [arXiv:2304.08960](https://arxiv.org/abs/2304.08960)

Independently develops a time-conditioned SDF framework for modeling cell morphology with rotation-equivariant implicit neural networks.
Its findings converge with the principles explored in **cell-sdf-topology**—continuous, function-based representations of living form evolving through time—offering empirical support for similar geometric intuitions.

---

## Purpose

**cell-sdf-topology** is motivated by the need to describe cellular morphodynamics in a rigorous, quantitative, and continuous way.
Traditional voxel or mesh methods fragment motion into discrete frames; this framework treats form and change as a single mathematical object.

---

## Core Idea

* **SDF-first:** Represent each cell by a function returning distance to its surface—compact, differentiable, and naturally extensible.
* **Time-conditioned:** The function depends on time; form and motion are unified.
* **Operators:** Reusable primitives (division, fusion, bleb, ruffle …) fitted to data to explain observed changes.
* **Residuals:** Persistent mismatches expose *new biology*—they define the discovery frontier.
* **World-tubes:** Continuous identities extruded through space-time. Splits and merges become topological events, not bookkeeping hacks.
* **Anchored signals:** Spectral or temporal measurements attached directly to the SDF manifold for consistent comparison across time and cells.

---

## Biological Mapping (Quick Guide)

| Term                 | Plain Meaning             | In Data                  | SDF-Operator Analogy                         | Fit Notes                                        |
| -------------------- | ------------------------- | ------------------------ | -------------------------------------------- | ------------------------------------------------ |
| **Blebbing**         | Local blister on membrane | Smooth cap + narrow neck | Local lobe + neck constraint                 | Gaussian lobe; enforce minimum neck radius.      |
| **Ruffling**         | Wavy surface ripples      | Periodic ridges          | Sinusoidal offset along tangent              | Detect periodic curvature; small amplitude.      |
| **Lamellipodium**    | Thin sheet extension      | Broad flange             | Anisotropic offset + taper                   | Thickness ≪ lateral extent.                      |
| **Filopodia**        | Thin spike                | Slender protrusion       | Rod union (centerline + radius)              | High aspect ratio; temporal persistence.         |
| **Mitotic rounding** | Pre-division smoothing    | Global contraction       | Isotropic scale deformation                  | Precedes cleavage.                               |
| **Cleavage furrow**  | Division constriction     | Saddle groove            | Soft-difference along plane + depth schedule | Commit split when topology separates & persists. |
| **Fusion / neck**    | Merge of cells            | Hourglass throat         | Soft-union with throat radius profile        | Commit when unified volume persists.             |
| **Budding**          | Daughter sprout           | Lobe → neck → split      | Local lobe + neck evolution                  | Extrudes new branch in world-tube.               |

---

## Fitting Workflow (Intuitive)

1. **From voxels:** Denoise → boundary likelihood → initial SDF.
2. **Propose operators** in candidate regions.
3. **Fit minimal operator** explaining the change.
4. **Check persistence** before confirming events.
5. **Record parameters** instead of bulky volumes.
6. **Analyze residuals**; persistent clusters → new operator archetypes.

---

## Lineage as World-Tubes

* Each identity is a continuous ownership field through space-time.
* **Split:** One surface separates into two → fork the tube.
* **Merge:** Two surfaces fuse → merge tubes.
* The SDF remains a single coherent function; lineage overlays handle identity.
* Continuity is intrinsic—no arbitrary ID tracking.

---

## Dimensional Analogy

| Spatial Dim                    | Extruded Form                | Physical Meaning             | Biological Analogy                  |
| ------------------------------ | ---------------------------- | ---------------------------- | ----------------------------------- |
| **0D (point)**                 | **1D world-line**            | Particle path through time   | Molecule trajectory.                |
| **1D (curve)**                 | **2D world-sheet**           | Filament deformation         | Cytoskeletal fiber dynamics.        |
| **2D (surface)**               | **3D world-tube**            | Membrane evolving            | Cell membrane history.              |
| **3D (volume)**                | **4D world hyper-tube**      | Body evolving                | Organism’s life history.            |
| **4D (hyper-volume)**          | **5D evolutionary manifold** | Changing rules of change     | Developmental or genetic evolution. |
| **5D (manifold of histories)** | **6D entangled field-space** | Coupled systems of histories | Ecosystem-scale co-evolution.       |

---

## Signals Anchored to Surfaces

* Sample consistently at fixed offsets (e.g., –100 nm / 0 / +200 nm).
* Attach curves for temporal or spectral data.
* In world-tubes, these become fields defined on the manifold—like texture on a surface.

---

## Data & Storage

* **SSOT (core):** SDF, operator parameters, schedules, lineage, signals.
* **Derived index:** Vector embeddings for similarity search (FAISS / pgvector / Milvus).
* Keep SSOT minimal and auditable; indices are regenerable.

---

## Residuals as Discovery

Persistent residuals near the surface mark phenomena the current operator basis cannot express—signals for new biology or model expansion.

---

## Geometry of Perception

World-tubes may mirror perceptual organization itself: a continuous manifold of experience.

| SDF World-Tube Construct | Perceptual Analog          |
| ------------------------ | -------------------------- |
| (f(x,y,z,t)=0)           | Unified field of awareness |
| (\nabla_{xyz}f)          | Static form perception     |
| (\partial f/\partial t)  | Motion perception          |
| Higher-order terms       | Momentum / anticipation    |
| Anchored signals         | Sensory qualities          |
| Topological events       | Perceived discrete events  |

---

## Limits of Representation — The Observation Dimension

Every self-representing system encounters an unmodeled dimension: the observer.
Residuals play the role of Gödel sentences—truths outside the current formal basis.
Completeness is asymptotic; the remainder marks the **discovery frontier**.

---

## Minimal Mental Model

* **Cells as programs:** Base shape + timed operators.
* **Events as schedules:** Onset → growth → decay.
* **Lineage intrinsic:** Geometry carries identity.
* **Signals follow surface:** Consistent sampling rules.
* **History = geometry:** Time extruded into form.

---

## Glossary

| Term                   | Meaning                                             |
| ---------------------- | --------------------------------------------------- |
| **SDF**                | Signed distance to a surface (– inside, + outside). |
| **Operator**           | Parameterized shape change primitive.               |
| **Schedule**           | Time-domain envelope controlling an operator.       |
| **World-tube**         | Continuous identity in (x,y,z,t).                   |
| **Residual**           | Persistent mismatch → discovery cue.                |
| **Manifold**           | Continuous geometric surface of the SDF.            |
| **Discovery Frontier** | Region where new operators emerge.                  |