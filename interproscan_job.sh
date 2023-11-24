#!/bin/bash
source /etc/profile

#$ -N interproscan_run
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o interproscan_run_$JOB_ID.out
#$ -e interproscan_run_$JOB_ID.err
#$ -pe smp 8
#$ -l h_rt=20:00:00
#$ -l h_vmem=30G

module load interproscan
module load java/openjdk1.8.0_345
module load Python3

FASTA=$1

interproscan.sh -i $FASTA
