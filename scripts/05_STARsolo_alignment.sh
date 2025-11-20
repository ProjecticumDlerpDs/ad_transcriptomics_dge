#!/bin/bash
# This script is intended to perform gene alignment with STARsolo
# In order to run this script STAR needs to be installed first, this should 
# allready have been done with 04_create_star_index.sh, if this is not the case
# run (conda install bioconda::star) after activating the environment

# Activate environment: 
source ~/miniconda3/etc/profile.d/conda.sh
conda activate star

# Stop the script upon errors
set -euo pipefail

# Path to files and directories
references="$HOME/ad_transcriptomics_dge/references"
star_index="$HOME/ad_transcriptomics_dge/references/STAR_index"
output_dir="$HOME/ad_transcriptomics_dge/analyses/STARsolo"
fastq_files="$HOME/ad_transcriptomics_dge/raw_data/fastq_data/split"

# Download reference file with barcodes for 10x Genomics V2
wget -P $references https://teichlab.github.io/scg_lib_structs/data/10X-Genomics/737K-august-2016.txt.gz

# Create an output directory if not allready existing
mkdir -p "$output_dir"

# Run STARsolo alignment
STAR --runThreadN 8 \
--runMode alignReads \
--genomeDir $star_index \
--readFilesIn $fastq_files \
--readFilesCommand zcat \
--soloType Droplet \
--soloCBwhitelist "$references/737K*" \
--soloOutFormatFeaturesGeneMatrix MTX \
--soloUMIlen 10 \
--soloCBlen 16
