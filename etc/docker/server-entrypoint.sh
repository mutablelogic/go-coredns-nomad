#!/bin/bash

if [ -z "$1" ]; then
    echo "No command specified"
    exit 1
fi

# Run the command
set -e
exec "$@"
