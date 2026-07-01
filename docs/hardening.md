<!-- Copyright © 2026 SurgeXi Business Intelligence, a Teamsmith Enterprises LLC company. All Rights Reserved. -->
# Hardening baseline

Even a homelab gets treated like production. This is the baseline posture the
infra in this repo assumes.

## Network

- **No model server is exposed directly to the internet.** Model servers bind
  to `127.0.0.1` and are reachable only through the gateway.
- **TLS terminates at the edge** (reverse proxy). Internal hops can stay plain
  on a trusted bridge network.
- **Default-deny firewall.** Only the proxy's TLS port is open inbound.

## Identity & access

- **Least-privilege service accounts** — containers run as non-root where the
  image allows; no ambient cloud credentials on the host.
- **One authenticated gateway** in front of every model. No unauthenticated
  paths to inference.
- Secrets come from a gitignored `.env` (or a secrets manager), never from the
  compose files in this repo.

## Runtime

- Pin image tags for reproducible deploys; review updates before rolling them.
- Resource ceilings on every container so one workload can't starve the host.
- Centralized logs + metrics (see `compose/monitoring.yaml`) so anomalies are
  visible.

## What this repo deliberately does NOT contain

Real hostnames, IPs, API keys, model names, or customer data. Everything here
is a placeholder you replace with your own values in a gitignored `.env`.
