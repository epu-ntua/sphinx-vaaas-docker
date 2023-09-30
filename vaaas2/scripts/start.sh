#!/usr/bin/env bash
set -Eeuo pipefail

MODE=${MODE:-prod}
cd /usr/share/nmap/scripts/vulscan/utilities/updater
chmod a+x updateFiles.sh
/bin/bash updateFiles.sh

cd /vaaas2
python3 -m pip install -r requirements.txt
python3 main.py --mode=$MODE
echo "VAAAS2 started......."
