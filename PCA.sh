#!/bin/bash -l



ml bioinfo-tools
ml ANGSD
ml PCAngsd/0.982


angsd -GL 2 -out green_toad_swe_no_bornholm_no_hybrid -nThreads 20 -doGlf 2 -doMajorMinor 1 -SNP_pval 1e-6 -doMaf 1 -bam bam.filelist.swe_no_bornholm_no_hybrid -minMaf 0.05
pcangsd.py -beagle green_toad_all.beagle.gz -o inbreeding/green_toad_all -inbreed -threads 20
