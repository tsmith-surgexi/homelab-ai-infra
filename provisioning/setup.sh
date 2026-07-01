#!/usr/bin/env bash
# Copyright © 2026 SurgeXi Business Intelligence, a Teamsmith Enterprises LLC company. All Rights Reserved.
# Host provisioning for an on-prem GPU inference node.
# Reference scaffold — review every step before running on real hardware.
# Placeholders only: no real hosts, keys, or model names.
set -euo pipefail

echo "==> [1/4] Base packages"
# sudo apt-get update && sudo apt-get install -y ca-certificates curl ufw

echo "==> [2/4] NVIDIA driver + container toolkit"
# Install the GPU driver and the NVIDIA Container Toolkit so Docker can see GPUs.
# See: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/

echo "==> [3/4] Docker Engine + compose plugin"
# curl -fsSL https://get.docker.com | sh

echo "==> [4/4] Hardening baseline"
# Least-privilege + firewall. Model servers bind to loopback; only the proxy
# is reachable. See docs/hardening.md for the full checklist.
# sudo ufw default deny incoming
# sudo ufw allow 443/tcp        # TLS at the edge only
# sudo ufw enable

echo "Done. Next: docker compose -f compose/inference.yaml up -d"
