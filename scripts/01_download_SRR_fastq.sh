#!/bin/bash
# Script to download .fastq-files from a list with SRR ID's with fasterq-dump

# Install packages 
# conda install sratoolkit

# Stop when errors occur
set -euo pipefail

# Path to directories 
project="$HOME/ad_transcriptomics_dge"
SRR_list="$project/raw_data/SRR_Acc_List.txt" 
output="$project/raw_data/fastq_data"

# Create output directory
mkdir -p "$output"

while read -r SRR || [[ -n "$SRR" ]]; do
    [[ -z "$SRR" ]] && continue   # skip empty lines
    echo ">>> Downloading $SRR ..."
    fastq-dump "$SRR" --gzip -O "$output"
    # Result: $output/${SRR}.fastq.gz
done < "$SRR_list"

echo "Files are saved in $output"