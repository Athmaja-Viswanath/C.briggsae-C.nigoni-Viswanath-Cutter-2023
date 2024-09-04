#!/bin/bash
#SBATCH --nodes=1
#SBATCH --mail-user=athmaja.viswanath@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --time=12:00:00


# Load necessary modules if required
module load featureCounts || { echo "Error: Could not load featureCounts"; exit 1; }

# Define paths and filenames
SAMPLES_FILE="../samples.txt"
GFF_FILE="referencegenome/briggsae_repeat.gff3"
OUTPUT_DIR="featurecounts_briggsae"
ALIGN_DIR="star_briggsae_aligned"

# Create the output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Process each sample listed in the text file
while IFS= read -r sample; do
    # Define input and output file paths
    BAM_FILE="${ALIGN_DIR}/${sample}Aligned.sortedByCoord.out.bam"
    OUTPUT_FILE="${OUTPUT_DIR}/${sample}.txt"

    # Check if the BAM file exists
    if [[ -f "$BAM_FILE" ]]; then
        # Run featureCounts
        featureCounts -t repeat_region -g Name -a "$GFF_FILE" -o "$OUTPUT_FILE" "$BAM_FILE"
        echo "Processed $sample: Results saved to $OUTPUT_FILE"
    else
        echo "Warning: BAM file $BAM_FILE does not exist. Skipping $sample."
    fi
done < "$SAMPLES_FILE"

echo "Feature counting for all samples is complete."


