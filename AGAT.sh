#!/bin/bash -l


ml bioinfo-tools
ml AGAT


#### Create the cds and protein fasta required to build a custom snpEff database.

agat_sp_extract_sequences.pl -g GCF_905171765.1_aBufBuf1.1_genomic.gff -f sequences.fa -t cds -o cds1.fa
sed 's/rna-//g' cds1.fa > cds.fa

agat_sp_extract_sequences.pl -g GCF_905171765.1_aBufBuf1.1_genomic.gff -f sequences.fa -t cds --protein -o prot1.fa
sed 's/rna-//g' prot1.fa > protein.fa
