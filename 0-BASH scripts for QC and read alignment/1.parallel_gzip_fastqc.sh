#!/bin/bash
#SBATCH --nodes=1
#SBATCH --mail-user=athmaja.viswanath@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --time=8:00:00

# Change to the directory containing the gzipped files
cd trimmed_output/ || { echo "Failed to change directory to trimmed_output/"; exit 1; }

# Load GNU Parallel for parallel processing
module load gnu-parallel/20191122 || { echo "Failed to load gnu-parallel module"; exit 1; }

# Unzip all .gz files in parallel
find *.gz | parallel "gunzip {}"

# Load necessary modules for FastQC
module load CCEnv StdEnv/2020 nixpkgs/16.09 fastqc/0.11.8 || { echo "Failed to load FastQC modules"; exit 1; }

# Create output directory for FastQC results if it doesn't exist
mkdir -p ../fastqc_after

# Run FastQC on all .fastq files in parallel and save results to the specified directory
find *.fastq | parallel "fastqc -outdir ../fastqc_after/ {}"

# Inform that the process is complete
echo "Processing complete. FastQC results are in ../fastqc_after/"
