# Validation Guide

This guide explains how to validate the eBPF/BCC lab environment.

## 1. Install Dependencies

```bash
sudo ./scripts/install-bcc-ubuntu.sh
```

## 2. Check the Environment

```bash
./scripts/check-ebpf-environment.sh
```

The script checks:

- Linux kernel information
- Python 3 availability
- Python `bcc` module import
- BCC tool availability
- tracing filesystem paths

## 3. Run a BCC Smoke Test

```bash
sudo ./scripts/run-bcc-smoke-test.sh
```

The script attempts to run a short BCC tracing command and triggers a few file operations.

## 4. Expected Result

A successful runtime validation should show that:

- BCC tools are installed
- the Python `bcc` module is importable
- tracing paths are available
- a BCC tracing tool can run with root privileges

## 5. Failure Notes

Failures are often environment-related rather than code-related.

Common causes:

- running outside Linux
- missing kernel headers
- missing BCC packages
- no root privileges
- restricted container or VM configuration
- unsupported kernel or architecture
