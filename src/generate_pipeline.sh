#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -e

# begin the pipeline.yml file
echo "steps:"
cat <<YAML
- command: sleep 120
  label: timeout test
  timeout_in_minutes: 2
YAML
