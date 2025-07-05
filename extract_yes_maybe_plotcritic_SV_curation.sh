#!/bin/bash -l

files="dups
invs"


for file in $files;do
	awk '$2==100.0 || $3==100.00' ${file}/${file}_summary_report.tsv \
	| awk '{print $1}' | sed 's/_/ /g' | sed 's/scaffold /scaffold_/g' | awk '{print $2 "\t" $3 "\t" $4}' | sort -V > ${file}_yes_maybe_sorted.bed
done


files="dels"
touch dels_yes_maybe.bed
for file in ${files}_{00..04};do	
	awk '$2==100.0 || $3==100.00' ${file}/${file}_summary_report.tsv \
        | awk '{print $1}' | sed 's/_/ /g' | sed 's/scaffold /scaffold_/g' | awk '{print $2 "\t" $3 "\t" $4}' >> dels_yes_maybe.bed
	
done
sort -V  dels_yes_maybe.bed > dels_yes_maybe_sorted.bed
