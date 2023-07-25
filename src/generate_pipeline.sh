#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"
echo "  - command: sleep 120"
echo "    label: timeout test"
echo "    timeout_in_minutes: 2"
