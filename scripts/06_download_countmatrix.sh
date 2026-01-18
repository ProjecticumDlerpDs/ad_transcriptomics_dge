#!/bin/bash
# Script to download countmatrix from GEO-database

# Stop when errors occur
set -euo pipefail

# Path to directories 
project="$HOME/ad_transcriptomics_dge"
output="$project/raw_data"

# Create output directory
mkdir -p $output

# Download countmatrix from 
wget -P $output https://ftp.ncbi.nlm.nih.gov/geo/series/GSE138nnn/GSE138852/suppl/GSE138852_counts.csv.gz

gzip -d $output/GSE138852_counts.csv.gz

echo "The count matrix is saved in: $output"
