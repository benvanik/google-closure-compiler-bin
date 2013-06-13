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
echo "Updating to the latest Closure Compiler..."

# wget -nv http://closure-compiler.googlecode.com/files/compiler-latest.zip
# unzip -o -q compiler-latest.zip
# rm compiler-latest.zip

git clone https://code.google.com/p/closure-compiler/ build-temp
cd build-temp
patch -p0 < ../patch.diff
ant
cp build/compiler.jar ../
cp build/externs.zip ../
cd ..
rm -rf build-temp
if [ -d "externs" ]; then
  rm -rf externs
fi
mkdir externs
unzip -d externs externs.zip
rm externs.zip

echo ""
