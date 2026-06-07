#!/usr/bin/env bash
set -euo pipefail

echo "[1/6] Kernel information"
uname -a

echo "[2/6] Python version"
python3 --version

echo "[3/6] Checking Python bcc module"
python3 - <<'PY'
from bcc import BPF
print("Python bcc module is available.")
PY

echo "[4/6] Checking common BCC tools"
if command -v opensnoop-bpfcc >/dev/null 2>&1; then
  echo "opensnoop-bpfcc found: $(command -v opensnoop-bpfcc)"
elif command -v opensnoop >/dev/null 2>&1; then
  echo "opensnoop found: $(command -v opensnoop)"
else
  echo "No opensnoop BCC tool found in PATH." >&2
  exit 1
fi

echo "[5/6] Checking tracing paths"
for path in /sys/kernel/debug/tracing /sys/kernel/tracing; do
  if [[ -d "${path}" ]]; then
    echo "Found tracing path: ${path}"
  fi
done

echo "[6/6] Environment check completed"
