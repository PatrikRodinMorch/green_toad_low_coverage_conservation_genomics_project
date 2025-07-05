#!/bin/bash -l

ml bioinfo-tools
ml ANGSD


angsd -b ${1}.bams -GL 2 -ref ../../../../../NBIS_annotation_delivery_Bufotes_viridis_13_10_2023/REORDER/fasta/genome/genome.order.fa \
-anc ../../../../../NBIS_annotation_delivery_Bufotes_viridis_13_10_2023/REORDER/fasta/genome/genome.order.fa -out ${1}/${1} -minMapQ 30 -minQ 20 -dosaf 1 -P 20


realSFS -cores 20 -fold 1 -seed 42 ${1}/${1}.saf.idx > ${1}/${1}.sfs
