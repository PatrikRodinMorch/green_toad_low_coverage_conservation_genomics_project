#!/bin/bash -l

module load bioinfo-tools
module load bwa
module load picard

java -Xmx110g -jar $PICARD MarkDuplicates \
--REMOVE_DUPLICATES true \
--INPUT ../${1}_sorted_aligned_to_bufo.bam \
--OUTPUT ${1}_aligned_to_bufo.dedup.bam \
--METRICS_FILE ${1}_aligned_to_bufo_marked_dup_metrics.txt
