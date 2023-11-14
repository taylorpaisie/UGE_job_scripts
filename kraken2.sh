#!/bin/bash
source /etc/profile

#$ -N Metagenomics_fastp_Kraken2_htseq
#$ -cwd
#$ -q short.q
#$ -pe smp 8
#$ -l h_rt=24:00:00
#$ -l max_vmem=64G
#$ -o Taxonomy_run.out
#$ -e Taxonomy_run.err

# IMPORTANT: Remember to replace the placeholders below with the actual paths
# for the Kraken2Database, GTF file and FASTQ files before running the script.

module load fastp/0.23.4
module load kraken/2.0.8
module load samtools/1.15.1
module load HTSeq/0.11.2

# Input files
FASTQ1="sample_R1.fastq"
FASTQ2="sample_R2.fastq"
KRAKEN2_DB="path/to/kraken2_db"
GTF_FILE="path/to/annotation.gtf"

# Run fastp
fastp -i $FASTQ1 -I $FASTQ2 -o output_R1.fastq.gz -O output_R2.fastq.gz -h fastp_report.html -j fastp_report.json -q 20 -l 50

# Run Kraken2
kraken2 --db $KRAKEN2_DB --paired --threads $NSLOTS --use-names --report kraken2_report.txt output_R1.fastq.gz output_R2.fastq.gz > kraken2_output.txt

# Run htseq-count
samtools view -bS kraken2_output.txt | samtools sort - -o kraken2_output.bam
htseq-count -f bam -r pos -t gene -i gene_id -m union --nonunique none kraken2_output.bam $GTF_FILE > htseq_output.txt

module unload fastp/0.23.4
module unload kraken/2.0.8
module unload samtools/1.15.1
module unload HTSeq/0.11.2


