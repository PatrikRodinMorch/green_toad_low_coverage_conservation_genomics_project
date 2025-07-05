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
	snpEff bufo -c bufo.config -csvStats -lof -stats ${p}_bufo.html ../green_toad_final_bufo.for_snpeff.${p}.vcf.gz | bgzip -f > ${p}.snpEff.vcf.gz
done
