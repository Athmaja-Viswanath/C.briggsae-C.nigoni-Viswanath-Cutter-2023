#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=12:00:00


module load CCEnv StdEnv/2020 trimmomatic/0.36 module load nixpkgs/16.09

# Define the file containing sample names
SAMPLES_FILE="samples.txt"

# Read each line from the samples file
while IFS= read -r sample; do
    java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE \
        ${sample}_R1.fastq ${sample}_R2.fastq \
        trimmed_output/${sample}_R1_paired.fq.gz trimmed_output/${sample}_R1_unpaired.fq.gz \
        trimmed_output/${sample}_R2_paired.fq.gz trimmed_output/${sample}_R2_unpaired.fq.gz \
        ILLUMINACLIP:$EBROOTTRIMMOMATIC/adapters/TruSeq3-PE-2.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:30
done < "$SAMPLES_FILE"


