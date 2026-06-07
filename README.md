# eBPF BCC Tracing Lab

![Static Validation](https://github.com/blackhebrewisraeli/ebpf-bcc-tracing-lab/actions/workflows/static-validation.yml/badge.svg)

This repository documents a Linux-based eBPF/BCC tracing lab environment.

It was prepared as a public evidence repository for Operating Systems coursework involving eBPF, BCC, Python, and syscall tracing. The repository focuses on environment setup, validation, and reproducible execution steps.

## What This Repository Demonstrates

- Installing BCC tooling on Ubuntu/Linux
- Validating Python access to the `bcc` module
- Checking kernel and tracing prerequisites
- Running BCC/eBPF tooling in a Linux VM
- Documenting runtime limitations of eBPF in containers and CI systems
- Keeping course submission files private

## Repository Structure

```text
.
├── README.md
├── .gitignore
├── docs/
│   ├── environment.md
│   ├── runtime-limitations.md
│   └── validation.md
├── scripts/
│   ├── check-ebpf-environment.sh
│   ├── install-bcc-ubuntu.sh
│   └── run-bcc-smoke-test.sh
└── .github/
    └── workflows/
        └── static-validation.yml
```

## Why This Is Not a Docker-Only Repository

Unlike xv6, eBPF programs run against the active Linux kernel. BCC tools often require:

- Linux kernel eBPF support
- kernel headers
- root privileges or elevated capabilities
- access to tracing/debug filesystems
- a compatible runtime environment

For that reason, this repository documents a Linux VM workflow instead of pretending that ordinary Docker execution is enough for full eBPF validation.

## Quick Start

On an Ubuntu VM:

```bash
chmod +x scripts/*.sh
sudo ./scripts/install-bcc-ubuntu.sh
./scripts/check-ebpf-environment.sh
sudo ./scripts/run-bcc-smoke-test.sh
```

## CI Scope

GitHub Actions performs static validation only:

- shell syntax checks
- repository structure checks
- Markdown file presence checks

Runtime eBPF validation must be performed on a real Linux VM or host with BPF support.

## Privacy and Academic Integrity

This repository does not include:

- submitted assignment archives
- final answer documents
- private university-provided PDFs
- screenshots with personal identifiers
- exact submitted solution files

It is intended to show environment preparation and systems-level tooling discipline without exposing course submission content.
