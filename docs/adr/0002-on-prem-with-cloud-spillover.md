# ADR 0002 — On-prem first, cloud spillover at the margin

- **Status:** Accepted
- **Context:** Owned GPUs give privacy, latency, and flat cost, but a fixed
  capacity ceiling. Pure cloud gives elasticity but pays per token and ships
  data off-network on every request.
- **Decision:** Serve the steady-state workload on-prem; spill over to a cloud
  tier only when local capacity is exhausted. The routing decision lives in the
  inference router (separate project), so infra and routing stay decoupled.
- **Consequences:**
  - ➕ On-prem economics and privacy for the bulk of traffic; cloud elasticity
    only at the peak margin.
  - ➕ A hardware failure degrades to cloud instead of going down.
  - ➖ Two control planes to operate (local + cloud creds). Bounded by IaC and a
    single gateway abstraction.
- **Alternatives considered:** all-cloud (cost + privacy cost at volume);
  all-on-prem (no headroom for spikes; capacity becomes a hard wall).
