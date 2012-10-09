#!/bin/bash

# This must currently run from the root of the repo
# TODO(benvanik): make this runnable from anywhere (find git directory?)
if [ ! -d ".git" ]; then
  echo "This script must be run from the root of the repository (the folder containing .git)"
  exit 1
fi

# =============================================================================
# Closure Compiler
# =============================================================================
echo "Grabbing latest Closure Compiler..."

# TODO(benvanik): compile from source
wget -nv http://closure-compiler.googlecode.com/files/compiler-latest.zip
unzip -o -q compiler-latest.zip
rm compiler-latest.zip

echo ""
