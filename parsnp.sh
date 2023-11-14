#!/bin/bash
source /etc/profile

#$ -N parsnp_run
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o parsnp_run.out
#$ -e parsnp_run.err
#$ -pe smp 4
#$ -l h_rt=40:00:00
#$ -l h_vmem=10G



module load parsnp/1.5.2 

genomes=$1
reference=$2


parsnp -v -d ${genomes} -r ${reference} -o parsnp_masked_recomb --verbose -c --use-fasttree


module unload parsnp/1.5.2