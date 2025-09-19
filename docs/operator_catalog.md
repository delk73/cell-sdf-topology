# Operator Catalog (Data-Driven)

Operators are not pre-defined abstractions but **fitted objects** derived from voxel data.

## Current Primitives
- **Division**: cleavage plane operator with depth schedule.
- **Fusion**: neck operator with radius schedule.
- **Protrusion/Blebs**: local lobe operators.
- **Ruffling**: sinusoidal offsets along tangent frames.
- **Rounding**: isotropic deformation.

## Process for Expansion
1. Fit known operators to voxel data.
2. Compute residuals.
3. Cluster persistent residuals.
4. If systematic, promote to a new operator archetype.

## Catalog Entry Template
- **Name**: short identifier.
- **Definition**: SDF operator form.
- **Parameters**: knobs that define variations.
- **Provenance**: datasets where observed, fit residual metrics.
- **Biological interpretation**: mapping to observed process.
