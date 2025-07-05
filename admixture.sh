#!/bin/bash -l

ml bioinfo-tools
ml ANGSD
ml PCAngsd/0.982

mkdir admixture_all/${2}
NGSadmix -likes green_toad_all.beagle.gz -K ${1} -P 20 -o admixture_all/${2}/K${1} -minMaf 0.05 
