#!/bin/bash -l


ml bioinfo-tools
ml ANGSD


realSFS saf2theta ${1}/${1}.saf.idx -outname ${1}/${1}.theta -sfs ${1}/${1}.sfs -fold 1
thetaStat print ${1}/${1}.theta.thetas.idx 2>/dev/null > ${1}/${1}_thetaW.txt

cd ${1}
thetaStat do_stat ${1}.theta.thetas.idx 
