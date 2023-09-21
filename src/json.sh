#!/bin/bash

# Function to generate JSON files
generate_json_file() {
    filename=$1
    data=$2

    echo "$data" > "$filename.json"
    echo "Generated $filename.json"
}

# Generate JSON files
generate_json_file "file1" '{"name": "John", "age": 25}'
generate_json_file "file2" '{"name": "Jane", "age": 30}'
generate_json_file "file2" '{"name": "Jane", "age": 32}'
