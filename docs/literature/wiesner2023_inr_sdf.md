# Generative Modeling of Living Cells with SO(3)-Equivariant INRs (Wiesner et al., 2023)

## Summary
Wiesner et al. introduced an SO(3)-equivariant implicit neural representation (INR) for 3D+time modeling of living cells. Each cell surface is represented as a continuous signed distance field (SDF) \(f(x,t,z)\) learned by a rotation-equivariant MLP, yielding compact, smooth, and topology-preserving 4D reconstructions from microscopy data.

## Relation to `cell-sdf-topology`
| Concept in Paper | Analog in Repo |
|------------------|----------------|
| Time-conditioned SDF \(f(x,t)\) | World-tube formalism (extrusion through time) |
| SO(3)-equivariance | Observation-frame invariance (rotation as latent symmetry) |
| Latent \(z\) disentangled from orientation | Synesthetic “operator invariants” |
| SDF as training target for microscopy | Operator fit from volumetric field data |
| Continuous shape evolution | Unified temporal manifold (no discrete frames) |

Both frameworks treat shape + time as a continuous manifold; `cell-sdf-topology` extends this toward perceptual and multi-cell couplings, blooming into higher-dimensional world-hyper-tubes.

## Relevance
- Confirms feasibility of SDF-first modeling for live cell morphology.
- Shows implicit representations handle division and fusion better than voxel/mesh pipelines.
- Motivates extending world-tube operators toward rotation- and scale-equivariant learning.

> This paper provides empirical grounding for evolving \(f(x,t)\) into data-driven SO(3)-equivariant INRs.

## Citation
Wiesner, D. et al. (2023). *Generative Modeling of Living Cells with SO(3)-Equivariant Implicit Neural Representations.* *Medical Image Analysis*, 102991. [arXiv:2304.08960](https://arxiv.org/abs/2304.08960)
