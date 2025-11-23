# Pipeline for Differential Gene Expression Analysis in Alzheimers disease

## Description
This project aims to develop a reliable and reproducible data-analysis pipeline for **single-nucleus RNA-seq (snRNA-seq)** data in order to identify **cell-type-specific differential gene expression** in Alzheimer’s disease.

## Contents
- [Data](#data)
- [Folderstructure](#folderstructure)
- [Packages and dependencies](#packages-and-dependencies)

___

## Data
In this project publicly available **DroNc-seq data** is used from the entorhinal cortex published by **Grubman et al.** (GEO ID: [GSE138852](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE138852)), containing nuclei from six Alzheimer patients and six controls (13,214 nuclei total).

## Folderstructure

```
├── ad_transcriptomics_dge.Rproj
├── analyses
│   └── fastqc
├── raw_data
│   ├── GSE138852_counts.csv
│   └── SRR_Acc_List.txt
├── references
│   ├── 737K-august-2016.txt.gz
│   ├── GRCh38.primary_assembly.genome.fa.gz
│   ├── STAR_index
│   └── gencode.v49.annotation.gtf.gz
├── scripts
│   ├── 01_download_SRR_fastq.sh
│   ├── 02_fastqc.sh
│   ├── 03_get_genome_reference.sh
│   ├── 04_create_star_index.sh
│   └── 05_STARsolo_alignment.sh
├── seurat
│   ├── Seurat_tutorial.Rmd
│   ├── Seurat_tutorial.pdf
│   └── filtered_gene_bc_matrices
└── README.md
```
___

## Packages and dependencies
Prior to analysis the following packages need to be installed;

| Package         | Version |
|-----------------|---------|
| ```miniconda``` |         |
| ```sra-tools``` |         |
|```STAR```       |         |
| ```Seurat```    |         |
|```here```       |         |
|```patchwork```  |         |
|```dyplr```      |         |



