#!/bin/bash
# This script performs QC control on .fastq files

# Stop when errors occur
set -euo pipefail

# Activate conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate snrnaseq

# Install packages
# conda install bioconda::fastqc

# Check if fastqc is available, if fastqc is not available then print error message and stop the script.
if ! command -v fastqc >/dev/null 2>&1; then
  echo "fastqc not found." >&2
  echo "Please install FastQC (version 0.12 or higher)." >&2
  exit 1
fi

# Path to directories
project="$HOME/ad_transcriptomics_dge"
input_dir="$project/raw_data/fastq_data"
output_dir="$project/analyses"

# Create output directory
mkdir -p "$output_dir"

# For-loop for FastQC analysis on each .fastq.gz-file 
for fastq_file in "$input_dir"/*.fastq.gz
do
  basename=$(basename "$fastq_file" .fastq.gz)
  echo "Running FastQC analysis on $basename."
  
  fastqc "$fastq_file" \
    --memory 4096 \
    -o "$output_dir"
done
echo "FastQC analysis completed."