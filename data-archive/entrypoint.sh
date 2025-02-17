#!/bin/sh
# entrypoint.sh
set -e

echo "Executing archive-jobs sequentially"

# Navigate to the archive-jobs directory
cd archive-jobs

# Execute the Python script
python3 mosip_archive_main.py

echo "Executed archive-jobs successfully"