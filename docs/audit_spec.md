# Audit Spec

## Purpose
Auditing ensures emitted docs and fitted operators remain consistent, reproducible, and scientifically grounded.

## Audit Dimensions
- **Section completeness**: all required parts of SSOT docs present.
- **Quality gates**: geometric error, signal fidelity, eikonal constraint.
- **Residual analysis**: systematic mismatches flagged.
- **Lineage validation**: tube splits/merges align with persistent topology change.
- **Persistence window checks**: events must last for >= N frames and exceed spatial displacement thresholds (beyond imaging noise floor).

## Discovery Pipeline
- Residuals are not only QC but also signals of new biology.
- Candidate anomalies -> reviewed as potential operator archetypes.
- Persistence windows vary by process:
  - Division: 5-10 frames at 1-2 min cadence, separation > voxel resolution.
  - Fusion: 3-5 frames with enlarging contact patch.
  - Blebs/protrusions: short-lived; detect via curvature/displacement rather than time gating.

## Outputs
- Audit reports (`audit_docs_report.md`) with pass/fail + notes.
- Residual heatmaps for visual inspection.
