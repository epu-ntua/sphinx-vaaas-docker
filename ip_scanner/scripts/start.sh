#!/usr/bin/env bash
set -Eeuo pipefail

MODE=${MODE:-prod}

cd /scanner
python3 -m pip install -r requirements.txt
python3 main.py --mode $MODE
echo "IP Scanner started......."
