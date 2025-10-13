#!/bin/bash

# Path to directories 
project="$HOME/Desktop/ad_transcriptomics_dge"
output="$project/raw_data/reference"

# Genome references from 10x Genomics
ref_url="https://cf.10xgenomics.com/supp/cell-exp/refdata-cellranger-GRCh38-1.2.0.tar.gz"
ref_tar="refdata-cellranger-GRCh38-1.2.0.tar.gz"
ref_name="refdata-cellranger-GRCh38-1.2.0"

# Create a reference folder
mkdir -p $output
