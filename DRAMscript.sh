!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=200G
#SBATCH --time=7-00:15:00     # 1 day and 15 minutes
#SBATCH --mail-user=ecord021@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="DRAM"
#SBATCH -p batch 

# Print current date
date

# Load conda
conda activate DRAM

# Concatenate BAMs
assembly=$1
output=$(basename -s .fa $assembly)
DRAM.py annotate -i $assembly -o $output --threads 20 --prodigal_mode single --low_mem_mode
DRAM.py distill -i $output/annotations.tsv -o ${output}_genome_summaries --trna_path $output/trnas.tsv --rrna_path $output/rrnas.tsv

# Print name of node
hostname
