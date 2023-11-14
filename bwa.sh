#!/bin/bash
source /etc/profile

#$ -N bwa_mem_alignment
#$ -q short.q
#$ -cwd
#$ -M your_email@cdc.gov
#$ -m abe
#$ -o bwa_mem_alignment.out
#$ -e bwa_mem_alignment.err
#$ -pe smp 8
#$ -l h_rt=10:00:00
#$ -l max_vmem=32G

# Load a specific version of the bwa module
module load bwa/0.7.17

# IMPORTANT: Remember to replace the placeholders below with the actual paths
# for the Reference file, thread_number, max_insert size and FastQ single end file before running the script.

bwa index -p <reference_output_prefix> <reference file>
bwa aln -t <thread_number> -f <out_bwa_file> <reference_output_prefix> <single_end_file>
bwa samse -a <max_insert_size> <reference_output_prefix> <out_bwa_file> <single_end_file> > out.sam


