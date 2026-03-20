#!/bin/bash

##################################################
# Python setup
##################################################
uv venv --python 3.13 --system-site-packages --clear 
uv sync --dev
