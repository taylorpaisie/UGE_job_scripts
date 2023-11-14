#!/bin/bash
source /etc/profile

#$ -N plot_gubbins
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o plot_gubbins.out
#$ -e plot_gubbins.err
#$ -pe smp 1
#$ -l h_rt=10:00:00
#$ -l h_vmem=5G

# Activate the version of R that we want
module load R/4.3.1

# Runs your R program
Rscript plot_gubbins.R --tree gubbins.tree  --rec gubbins.recombination_predictions.gff --annotation genomic.gff  --meta subpanel_mlst_metadata.csv --output gubbins_plot.png