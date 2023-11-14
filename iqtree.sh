#!/bin/bash
source /etc/profile

#$ -N iqtree_run
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o iqtree_run.out
#$ -e iqtree_run.err
#$ -pe smp 2
#$ -l h_rt=10:00:00
#$ -l h_vmem=510G

module load iqtree/2.1.2

ALN=$1

iqtree -s $ALN -m MFP+ASC -lmap 10000 -bb 1000 

