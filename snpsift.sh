#!/bin/bash -l


ml bioinfo-tools
ml samtools
ml snpEff


pops="utklippan
poland
pepparholm
norra_hamnen
lundakrabukten
limhamn
hybrid
falsterbo
eskilstorp
brantevik
bornholm"

for p in $pops;do

	zcat ${p}.snpEff.vcf.gz | snpSift filter "(ANN[*].IMPACT='HIGH')" | bgzip -f > ${p}.snpEff.HIGH.vcf.gz
	zcat ${p}.snpEff.vcf.gz | snpSift filter "(ANN[*].IMPACT='MODERATE')" | bgzip -f > ${p}.snpEff.MODERATE.vcf.gz
	zcat ${p}.snpEff.vcf.gz | snpSift filter "(ANN[*].IMPACT='LOW')" | bgzip -f > ${p}.snpEff.LOW.vcf.gz


done
