#!/bin/bash
# Script to download .fastq-files from a list with SRR ID's with fasterq-dump

# Install packages 
# conda install bioconda::sra-tools

# Activate conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate snrnaseq

# Stop when errors occur
set -euo pipefail

# Path to directories 
project="$HOME/ad_transcriptomics_dge"
SRR_list="$project/raw_data/SRR_Acc_List.txt" 
output="$project/raw_data/fastq_data"

if ! command -v fastq-dump >/dev/null 2>&1; then
  echo "'fastq-dump' was not found." >&2
  echo "Please install sratoolkit." >&2
  exit 1
fi

# Create output directory
mkdir -p "$output"

while read -r SRR || [[ -n "$SRR" ]]; do
    [[ -z "$SRR" ]] && continue   # skip empty lines
    echo ">>> Downloading $SRR ..."
    fastq-dump "$SRR" --gzip -O "$output"
    # Result: $output/${SRR}.fastq.gz
done < "$SRR_list"

echo "Files are saved in $output"