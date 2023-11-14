#!/bin/bash
source /etc/profile

#$ -N blast_run
#$ -q all.q
#$ -cwd
#$ -M ltj8@cdc.gov
#$ -m abe
#$ -o blast_run.out
#$ -e blast_run.err
#$ -pe smp 8
#$ -l h_rt=10:00:00
#$ -l h_vmem=30G


module load ncbi-blast+/2.14.0

fasta=$1

# IMPORTANT: Remember this is an actual Test Script, your Instructor should share example_data.fasta and /scicomp/reference/ncbi-blast/current/ref_euk_rep_genomes files with you, if they have not, please STOP them and ASK. The path to databases: "/scicomp/reference/ncbi-blast/current/" if you wish to use other databases.

blastn -query $fasta -num_threads $NSLOTS -num_alignments 20 -db /scicomp/reference/ncbi-blast/current/nt -outfmt "6 qseqid sseqid pident qlen slen qstart qend sstart send evalue bitscore" > ${fasta}_blast_output.txt

#this isn't needed in this case but it is good to unload modules once you don't need them in long workflows
module unload ncbi-blast+/2.14.0