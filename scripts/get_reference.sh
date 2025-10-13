#!/bin/bash

# Path to directories 
project="$HOME/ad_transcriptomics_dge"
output="$project/raw_data/references"

# Create output directory
mkdir $output

# Download genome reference from GENCODE
wget -P $output https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_49/GRCh38.primary_assembly.genome.fa.gz
# Download GTF-file from GENCODE
wget -P $output https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_49/gencode.v49.annotation.gtf.gz