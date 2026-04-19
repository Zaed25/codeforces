#!/bin/bash

# Usage: ./scripts/setup_problem.sh <difficulty> <problem_name>
# Example: ./scripts/setup_problem.sh 800 way_too_long_words

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <difficulty> <problem_name>"
    exit 1
fi

DIFF=$1
NAME=$2
DIR="problems/$DIFF"
FILE="$DIR/$NAME.cpp"

# Create directory if it doesn't exist
mkdir -p "$DIR"

# Copy template if file doesn't exist
if [ ! -f "$FILE" ]; then
    cp templates/base_template.cpp "$FILE"
    echo "Created $FILE from template."
else
    echo "File $FILE already exists."
fi

# Ensure data/input.txt exists
touch data/input.txt
echo "Problem setup complete. Edit $FILE and add input to data/input.txt"
