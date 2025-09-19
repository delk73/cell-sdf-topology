# Cell SDF Topology

Research repo exploring **time-conditioned SDFs** as the single source of truth for cell surfaces, including **topology-changing processes** (division, fusion, blebbing, ruffling).

## Paradigm

This repo follows the **init / emit / audit** canon for standup rigor:

- **Init** → fit base SDFs, define primitive operators, seed catalog.
- **Emit** → generate geometry/signal realizations from F(x,y,z,t), expose APIs.
- **Audit** → measure error, enforce provenance, surface residuals.

### SSOT vs Prompts
- **`docs/`**: First-class, single source of truth (design specs, operator catalog, fitting routines, audit methods).
- **`meta/prompts/`**: Provenance trail of prompts used to stand up specs and code.

## License

MIT – see [LICENSE](LICENSE).

## Citation

If you use this work, please cite via [CITATION.cff](CITATION.cff).
