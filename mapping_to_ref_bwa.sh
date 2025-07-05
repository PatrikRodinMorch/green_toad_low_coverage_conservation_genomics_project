#!/bin/bash -l

module load bioinfo-tools
module load bwa
module load picard

echo ${1}


bwa mem -t 20 -M -R "@RG\tID:$1\tSM:$1\tPL:ILLUMINA\tPI:330" \
/crex/proj/snic2021-6-165/green_toad_Leonie/mapping/bufo_genome/GCF_905171765.1_aBufBuf1.1_genomic.fna \
../raw/concat/trimmo/${1}_R1_paired.fastq.gz \
../raw/concat/trimmo/${1}_R2_paired.fastq.gz | \
java -jar $PICARD SortSam I=/dev/stdin O=${1}_sorted_aligned_to_bufo.bam SORT_ORDER=coordinate

