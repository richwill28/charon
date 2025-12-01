#!/usr/bin/env bash
# Wrapper script to run Charon with custom rustc
# Usage: ./run-charon-with-custom-rustc.sh [charon arguments...]

# Path to your custom rustc stage2
CUSTOM_RUSTC_BIN="$HOME/repo/rust/build/x86_64-unknown-linux-gnu/stage2/bin"
CUSTOM_RUSTC_LIB="$HOME/repo/rust/build/x86_64-unknown-linux-gnu/stage2/lib"

# Set up environment for custom rustc
export PATH="$CUSTOM_RUSTC_BIN:$PATH"
export LD_LIBRARY_PATH="$CUSTOM_RUSTC_LIB:$LD_LIBRARY_PATH"
export CHARON_TOOLCHAIN_IS_IN_PATH=1

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run charon with all passed arguments
exec "$SCRIPT_DIR/../bin/charon" "$@"
