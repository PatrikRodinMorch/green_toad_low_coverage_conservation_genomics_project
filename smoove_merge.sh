#!/bin/bash -l


conda activate smoove

ml bioinfo-tools
ml LUMPY

#Reference genome that reads were mapped to:
REF=/proj/snic2021-6-165/Green_toad_scaffolded_assembly/pt_097_001.toad.ipa1.5.0.purged.primary.yahs.r2.1.scf.FINAL.fa

smoove merge --name merged -f $REF --outdir ./ results-smoove/*.genotyped.vcf.gz

conda deactivate
