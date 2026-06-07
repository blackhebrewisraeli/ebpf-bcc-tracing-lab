# Environment

This repository is designed for a Linux VM or Linux host with eBPF support.

## Recommended Environment

A practical setup is:

```text
Ubuntu Server/Desktop 22.04 or newer
Linux kernel with eBPF support
Python 3
BCC / bpfcc tools
clang / LLVM
kernel headers for the running kernel
```

## Required Packages

The installation script installs the following main packages when available:

```text
bpfcc-tools
python3-bpfcc
clang
llvm
libelf-dev
linux-headers-$(uname -r)
build-essential
```

Package availability can vary between Ubuntu versions and CPU architectures.

## Root Privileges

Most BCC/eBPF tracing tools require root privileges because they attach to kernel tracing hooks.

Use:

```bash
sudo <command>
```

when running runtime tracing tools.

## Validation Strategy

The repository separates validation into two layers:

1. Static repository validation through GitHub Actions.
2. Runtime eBPF validation on a real Linux VM or host.

This separation is intentional because CI systems usually do not expose the kernel capabilities required for full eBPF tracing.
