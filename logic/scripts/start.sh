#!/usr/bin/env bash
set -Eeuo pipefail

MODE=${MODE:-prod}

cd /logic
python3 -m pip install -r requirements.txt
python3 main.py --mode $MODE
echo "VAaaS started......."
