#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "This installer is intended for Linux only." >&2
  exit 1
fi

if [[ "${EUID}" -ne 0 ]]; then
  echo "Please run this script with sudo." >&2
  exit 1
fi

apt-get update

apt-get install -y --no-install-recommends \
  build-essential \
  clang \
  llvm \
  libelf-dev \
  bpfcc-tools \
  python3-bpfcc \
  "linux-headers-$(uname -r)"

echo "BCC/eBPF dependencies installed."
