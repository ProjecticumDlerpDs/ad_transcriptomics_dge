#!/bin/bash

# Install STAR: 
# conda install bioconda::star

# Activate environment: 
# conda activate star

# Stop the script upon errors
set -euo pipefail

# Path to files and directories
genome_ref_gz="$HOME/ad_transcriptomics_dge/raw_data/references/GRCh38.primary_assembly.genome.fa.gz"
gene_annotations_gz="$HOME/ad_transcriptomics_dge/raw_data/references/gencode.v49.annotation.gtf.gz"
output_dir="$HOME/ad_transcriptomics_dge/raw_data/references/STAR_index"

# Create an output directory if not allready existing
mkdir -p "$output_dir"

# Unzip compressed files
gunzip -kf "$genome_ref_gz"
gunzip -kf "$gene_annotations_gz"

# Create new variables for unzipped files
genome_ref="$HOME/ad_transcriptomics_dge/raw_data/references/GRCh38.primary_assembly.genome.fa"
gene_annotations="$HOME/ad_transcriptomics_dge/raw_data/references/gencode.v49.annotation.gtf"

# Create indexfile readsize is 150 bp, refgenome is GRCh38.
STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $output_dir \
--genomeFastaFiles $genome_ref \
--sjdbGTFfile $gene_annotations \
--sjdbOverhang 149 

# Re-compress the reference files
gzip -f "$genome_ref"
gzip -f "$gene_annotations"
