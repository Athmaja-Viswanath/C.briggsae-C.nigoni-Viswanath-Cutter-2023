#!/bin/bash
#SBATCH --nodes=1
#SBATCH --mail-user=athmaja.viswanath@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --time=12:00:00

# Navigate to the directory with gzipped files
cd trimmed_output/ || { echo "Error: Could not change to 'trimmed_output/'"; exit 1; }

# Load required modules
module load gnu-parallel || { echo "Error: Could not load gnu-parallel"; exit 1; }
module load CCEnv nixpkgs/16.09 gcc/7.3.0 star/2.7.3a || { echo "Error: Could not load required modules"; exit 1; }

# Align samples with STAR to C.briggsae
cat ../samples.txt | parallel -j4 \
    STAR --runThreadN 10 \
         --genomeDir ../../indexed_briggsae/ \
         --readFilesIn {}_R1_paired.fq {}_R2_paired.fq \
         --outFileNamePrefix ../star_results_briggsae/{}_briggsae \
         --outSAMtype BAM SortedByCoordinate

# Align samples with STAR to C.nigoni
cat ../samples.txt | parallel -j4 \
    STAR --runThreadN 10 \
         --genomeDir ../../indexed_nigoni/ \
         --readFilesIn {}_R1_paired.fq {}_R2_paired.fq \
         --outFileNamePrefix ../star_results_nigoni/{}_nigoni \
         --outSAMtype BAM SortedByCoordinate

# Notify that processing is complete
echo "STAR alignment for both genomes is complete. Check ../star_results_briggsae/ and ../star_results_nigoni/ for results."
