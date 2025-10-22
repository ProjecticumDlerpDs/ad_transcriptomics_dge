#!/bin/bash
# This script is intended to create a STAR indexfile. This indexfile is used to 
# align snRNA-seq data to the GRCh38 genome. To build the indexfile this script
# uses the full human genome fasta sequence and an annotation gene transfer 
# format file as input to create an index file, the indexfile will be used 
# downstream in the analysis to efficiently align sample sequences.

# Activate environment: 
# conda activate star

# Install STAR: 
# conda install bioconda::star

# Stop the script upon errors
set -euo pipefail

# Path to files and directories
genome_ref_gz="$HOME/ad_transcriptomics_dge/references/GRCh38.primary_assembly.genome.fa.gz"
gene_annotations_gz="$HOME/ad_transcriptomics_dge/references/gencode.v49.annotation.gtf.gz"
output_dir="$HOME/ad_transcriptomics_dge/references/STAR_index"

# Create an output directory if not allready existing
mkdir -p "$output_dir"

# Unzip compressed files
gunzip -kf "$genome_ref_gz"
gunzip -kf "$gene_annotations_gz"

# Create new variables for unzipped files
genome_ref="$HOME/ad_transcriptomics_dge/references/GRCh38.primary_assembly.genome.fa"
gene_annotations="$HOME/ad_transcriptomics_dge/references/gencode.v49.annotation.gtf"

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
