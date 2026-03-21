#!/usr/bin/env bash
# Wrapper script to run Charon with custom rustc
# Usage: ./run-charon-with-custom-rustc.sh [charon arguments...]

# If CUSTOM_RUSTC_STAGE2 is unset or empty, use a clearly-invalid default
: "${CUSTOM_RUSTC_STAGE2:=unprovided_path_to_custom_rustc_stage2}"

CUSTOM_RUSTC_BIN="$CUSTOM_RUSTC_STAGE2/bin/rustc"
CUSTOM_RUSTC_LIB="$CUSTOM_RUSTC_STAGE2/lib"

# Validate custom rustc
if [ ! -x "$CUSTOM_RUSTC_BIN" ]; then
    echo "error: custom rustc not found or not executable:"
    echo "  $CUSTOM_RUSTC_BIN"
    echo "hint: set the environment variable CUSTOM_RUSTC_STAGE2 to the"
    echo "      path of your rust build's stage2 directory"
    echo "      (e.g. .../build/<target>/stage2)"
    exit 1
fi

# Validate rustc stage2 lib directory
if [ ! -d "$CUSTOM_RUSTC_LIB" ]; then
    echo "error: custom rustc lib directory not found:"
    echo "  $CUSTOM_RUSTC_LIB"
    echo "hint: set the environment variable CUSTOM_RUSTC_STAGE2 to the"
    echo "      path of your rust build's stage2 directory"
    echo "      (e.g. .../build/<target>/stage2)"
    exit 1
fi

# Set up environment for custom rustc
export PATH="$CUSTOM_RUSTC_BIN:$PATH"
export LD_LIBRARY_PATH="$CUSTOM_RUSTC_LIB:$LD_LIBRARY_PATH"
export CHARON_TOOLCHAIN_IS_IN_PATH=1

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run charon with all passed arguments
exec "$SCRIPT_DIR/../bin/charon" "$@"
