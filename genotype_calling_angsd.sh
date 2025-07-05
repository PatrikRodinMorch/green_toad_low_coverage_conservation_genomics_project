#!/bin/bash -l



ml bioinfo-tools
ml ANGSD


angsd -b bam.filelist.bufo -GL 2 -dopost 1 -domajorminor 1 -domaf 1 -dobcf 1 --ignore-RG 0 -dogeno 1 -docounts 1 -snp_pval 1e-6 -minMapQ 30 -minQ 20 -out all/all_bufo -P 20
