#!/bin/bash

# Create virtual environment and install ALL dependencies using uv
# Installs in local .venv directory (not system-wide)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "Setting up Python environment with uv..."
echo "=========================================="

echo "Creating virtual environment in .venv..."
uv venv .venv

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Installing Jupyter and all notebook dependencies..."
uv pip install jupyter jupyterlab ipykernel ipywidgets

echo "Installing data science packages..."
uv pip install pandas numpy matplotlib seaborn scipy scikit-learn

echo "Installing additional useful packages..."
uv pip install plotly nbconvert openpyxl xlrd

echo "Installing kernel for Jupyter..."
python -m ipykernel install --user --name=faang_env

echo "=========================================="
echo "Setup complete!"
echo "=========================================="
echo ""
echo "To activate the environment:"
echo "  source .venv/bin/activate"
echo ""
echo "To start Jupyter Lab:"
echo "  jupyter lab"
echo ""
echo "To start Jupyter Notebook:"
echo "  jupyter notebook"
echo ""
echo "Virtual environment location: $SCRIPT_DIR/.venv"
