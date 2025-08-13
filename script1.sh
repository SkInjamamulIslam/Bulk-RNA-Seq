#!/bin/bash

# Set the path to the input directory as the current directory
input_dir=$(pwd)

# Loop over all fq.gz files in the input directory
for file in "$input_dir"/*.fastq; do
    # Extract the filename without the extension
    filename=$(basename "$file" .fastq)

    # Run the trimmomatic command on the file
    java -jar trimmomatic-0.39.jar SE -threads 32 "$file" "$input_dir/$filename"_trimmed.fastq TRAILING:10 -phred33 
done

