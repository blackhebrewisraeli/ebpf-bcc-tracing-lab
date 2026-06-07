#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "This smoke test must run on Linux." >&2
  exit 1
fi

if [[ "${EUID}" -ne 0 ]]; then
  echo "Please run this script with sudo." >&2
  exit 1
fi

if command -v opensnoop-bpfcc >/dev/null 2>&1; then
  OPENSNOOP="opensnoop-bpfcc"
elif command -v opensnoop >/dev/null 2>&1; then
  OPENSNOOP="opensnoop"
else
  echo "opensnoop BCC tool was not found." >&2
  exit 1
fi

echo "Starting short BCC opensnoop smoke test..."
echo "The test will run for a few seconds."

timeout 8 "${OPENSNOOP}" > /tmp/ebpf_bcc_smoke_test.log 2>&1 &
SNOOP_PID=$!

sleep 2
cat /etc/hostname >/dev/null || true
touch /tmp/ebpf_bcc_smoke_test_file.txt
cat /tmp/ebpf_bcc_smoke_test_file.txt >/dev/null || true

wait "${SNOOP_PID}" || true

echo "Smoke test output:"
cat /tmp/ebpf_bcc_smoke_test.log || true

echo "BCC smoke test completed."
