#!/bin/bash -l


ml bioinfo-tools
ml ANGSD

realSFS falsterbo/falsterbo.saf.idx ${1}/${1}.saf.idx -P 20 -fold 1 > fst/falsterbo.${1}.ml

realSFS fst index falsterbo/falsterbo.saf.idx ${1}/${1}.saf.idx -whichFst 1 -sfs fst/falsterbo.${1}.ml -fstout fst/falsterbo.${1}

realSFS fst stats fst/falsterbo.${1}.fst.idx > fst/pairwise_fst_falsterbo_${1}.txt
