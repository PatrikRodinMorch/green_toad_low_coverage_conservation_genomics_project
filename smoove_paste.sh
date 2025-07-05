#!/bin/bash -l

conda activate smoove

ml bioinfo-tools
ml LUMPY
ml bcftools


OUT_VCF=green_toad_SV

smoove paste --name $OUT_VCF results-genotyped/*.vcf.gz

conda deactivate
