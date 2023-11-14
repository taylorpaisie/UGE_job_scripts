#!/bin/bash
source /etc/profile

# Start the script in the current working directory
#$ -cwd

# Send to the ALL queue
#$ -q short.q

# Name the job so that I can reference it later by this name
#$ -N myBEASTjob

#$ -o beast_run.out
# Set the error log file
#$ -e beast_run.err

# Load the specific version of the modules needed
module load beast/2.6.3
module load beagle-lib/3.2.0-cuda

## Now we do work ...
beast -overwrite -beagle_gpu EquineChile_HA_GTR_Strict.xml

module unload beast/2.6.3
module unload beagle-lib/3.2.0-cuda


