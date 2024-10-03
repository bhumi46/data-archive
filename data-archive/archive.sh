#!/bin/bash

# Enable strict error handling
set -euo pipefail

echo "Executing archive-jobs sequentially"

# Navigate to the archive-jobs directory
cd archive-jobs

# Execute the Python script
python3 mosip_archive_main.py

echo "Executed archive-jobs successfully"

