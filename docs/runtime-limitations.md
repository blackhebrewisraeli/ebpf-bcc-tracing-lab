# Runtime Limitations

eBPF is tightly coupled to the running Linux kernel.

## Why Ordinary Docker Is Not Enough

A standard Docker container does not provide an independent kernel. It shares the host kernel. Therefore, eBPF tools inside a container may fail unless the host exposes the required kernel features, filesystems, capabilities, and headers.

Typical issues include:

- missing kernel headers
- missing tracing/debug filesystem mounts
- missing BPF capabilities
- restricted container security profile
- incompatible host kernel
- unavailable BCC package for the target architecture

## Recommended Approach

For coursework and repeatable validation, prefer a Linux VM.

A VM gives stronger control over:

- kernel version
- installed headers
- BCC packages
- root access
- tracing filesystem availability

## CI Limitation

GitHub Actions is useful for checking repository structure and shell syntax, but it is not a reliable replacement for runtime eBPF validation.

The workflow in this repository therefore performs static validation only.
