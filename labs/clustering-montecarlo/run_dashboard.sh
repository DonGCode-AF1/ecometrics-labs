#!/bin/bash
echo "Starting BDM (2004) clustering simulation sandbox..."
if [ "$(uname)" == "Darwin" ]; then
    open "$(dirname "$0")/bdm_simulation_dashboard.html"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    xdg-open "$(dirname "$0")/bdm_simulation_dashboard.html"
else
    echo "Unsupported OS. Please open bdm_simulation_dashboard.html manually in your browser."
fi
