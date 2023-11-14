#!/bin/bash
source /etc/profile

#$ -N bowtie2_alignment
#$ -q short.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o bowtie2_alignment.out
#$ -e bowtie2_alignment.err
#$ -pe smp 8
#$ -l h_rt=10:00:00
#$ -l max_vmem=32G

module load bowtie2/2.3.5.1

# IMPORTANT: Remember to replace the placeholders below with the actual paths
# for the Bowtie2 Index,and FASTQ files before running the script.

bowtie2 -p $NSLOTS -x /path/to/reference_genome_index -1 read1.fastq.gz -2 read2.fastq.gz -S - | samtools view -bS > out.bam 

module unload bowtie2/2.3.5.1



