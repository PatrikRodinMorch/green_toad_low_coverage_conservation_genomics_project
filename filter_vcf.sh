#!/bin/bash -l


ml bioinfo-tools
ml bcftools


bcftools view -i 'SVTYPE="DEL" & DHFFC <0.7 & (INFO/MSHQ >=3 || INFO/MSHQ=-1)' -f '%CHROM\t%POS\t%END\t%INFO/MSHQ\n' green_toad_final_SV.smoove.square.smoove.square.MSHQanno.vcf.gz | bgzip -c > DEL_Duphold_MSHQ.vcf.gz


bcftools view -i 'SVTYPE="DUP" & DHBFC >1.3 & (INFO/MSHQ >= 3 || INFO/MSHQ=-1)' -f '%CHROM\t%POS\t%END\t%INFO/MSHQ\n' green_toad_final_SV.smoove.square.smoove.square.MSHQanno.vcf.gz | bgzip -c > DUP_Duphold_MSHQ.vcf.gz


bcftools view -i 'SVTYPE="INV" & (INFO/MSHQ >= 3 || INFO/MSHQ=-1)' -f '%CHROM\t%POS\t%END\t%INFO/MSHQ\n' green_toad_final_SV.smoove.square.smoove.square.MSHQanno.vcf.gz | bgzip -c > INV_Duphold_MSHQ.vcf.gz
