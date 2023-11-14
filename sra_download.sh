#!/bin/bash

#$ -N sra_download
#$ -q short.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o sra_download.out
#$ -e sra_download.err
#$ -pe smp 8
#$ -l h_rt=10:00:00
#$ -l h_vmem=50G

module load nextflow/23.04.02 
module load nf-core/2.10 
module load sratoolkit

SRA_ID = $1


nextflow run nf-core/fetchngs \
   -profile singularity \
   --input $SRA_ID
   --outdir sra_fastqs


