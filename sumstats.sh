#!/bin/bash -l


pops="bornholm
brantevik
eskilstorp
falsterbo
hybrid
lernacken
limhamn
lundakrabutken
norra_hamnen
pepparholm
poland
utklippan"


for p in $pops;do

	awk 'NR>1 {print $3}' ${p}/${p}_thetaW.txt > ${p}/column_thetaw.txt

	awk '{print exp($1)}' ${p}/column_thetaw.txt > ${p}/exp_thetaw.txt

	echo ${p} >>  theta_W_per_pop_sd.txt
	echo ${p} >>  theta_W_per_pop_mean.txt

	awk '{sum+=$1; sumsq+=($1)^2} END {mean=sum/NR; variance=sumsq/NR - (mean*mean); print sqrt(variance)}' ${p}/exp_thetaw.txt >> theta_W_per_pop_sd.txt

	awk '{ sum += $1 } END { print sum / NR }' ${p}/exp_thetaw.txt >> theta_W_per_pop_mean.txt


	awk 'NR>1 {print $4}' ${p}/${p}_thetaW.txt > ${p}/column_thetapi.txt
	awk '{print exp($1)}' ${p}/column_thetapi.txt > ${p}/exp_thetapi.txt

	echo ${p} >> theta_pi_per_pop_sd.txt
	echo ${p} >> theta_pi_per_pop_mean.txt

	awk '{sum+=$1; sumsq+=($1)^2} END {mean=sum/NR; variance=sumsq/NR - (mean*mean); print sqrt(variance)}' ${p}/exp_thetapi.txt >> theta_pi_per_pop_sd.txt
	awk '{ sum += $1 } END { print sum / NR }' ${p}/exp_thetapi.txt >> theta_pi_per_pop_mean.txt

	touch tajimas_D_per_pop.txt
	touch tajimas_D_per_pop_SD.txt

	echo ${p} >> tajimas_D_per_pop.txt

	awk '{print $9}' ${p}/${p}.theta.thetas.idx.pestPG | tail -n+2 > ${p}/${p}_tajimas_D.txt
	awk '{sum+=$1; sumsq+=($1)^2} END {mean=sum/NR; variance=sumsq/NR - (mean*mean); print sqrt(variance)}' ${p}/${p}_tajimas_D.txt >> tajimas_D_per_pop_SD.txt
	awk '{ sum += $1 } END { print sum / NR }' ${p}/${p}_tajimas_D.txt >> tajimas_D_per_pop.txt

done
