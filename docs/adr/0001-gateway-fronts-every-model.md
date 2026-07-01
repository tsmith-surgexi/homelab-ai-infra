<!-- Copyright © 2026 SurgeXi Business Intelligence, a Teamsmith Enterprises LLC company. All Rights Reserved. -->
# ADR 0001 — One authenticated gateway in front of every model

- **Status:** Accepted
- **Context:** Exposing model servers directly multiplies the attack surface
  (one open port per model) and scatters auth, logging, and rate-limiting across
  every backend.
- **Decision:** Model servers bind to loopback and are reachable only through a
  single OpenAI-compatible gateway. A reverse proxy in front of the gateway is
  the only internet-facing surface and terminates TLS + authentication.
- **Consequences:**
  - ➕ Auth, observability, and rate-limiting live at one seam.
  - ➕ Adding a model doesn't add a public port.
  - ➕ The internet-facing attack surface is exactly one hardened endpoint.
  - ➖ The gateway is a critical path; it's kept simple and monitored, and the
    proxy can fail over.
- **Alternatives considered:** per-model public endpoints (large surface,
  duplicated controls); SSH tunnels per client (operationally brittle).
