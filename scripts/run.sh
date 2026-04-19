#!/bin/bash

# Usage: ./scripts/run.sh path/to/file.cpp

if [ -z "$1" ]; then
    echo "Usage: $0 path/to/file.cpp"
    exit 1
fi

FILE=$1
FILENAME=$(basename -- "$FILE")
FILENAME_NO_EXT="${FILENAME%.*}"
EXECUTABLE="./data/${FILENAME_NO_EXT}"

# Compile
# -O3: Optimization level 3
# -std=c++20: C++20 standard
# -I include: Include our custom bits/stdc++.h
clang++ -O3 -std=c++20 -I "$(pwd)/include" "$FILE" -o "$EXECUTABLE"

if [ $? -eq 0 ]; then
    echo "Compilation successful. Running..."
    echo "--------------------------------"
    # Run with input redirection
    time "$EXECUTABLE" < ./data/input.txt
    echo "--------------------------------"
else
    echo "Compilation failed."
fi
