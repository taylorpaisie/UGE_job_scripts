#!/bin/bash
source /etc/profile

#$ -N bakta_run
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o bakta_run.out
#$ -e bakta_run.err
#$ -pe smp 2
#$ -l h_rt=10:00:00
#$ -l h_vmem=20G

