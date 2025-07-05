#!/bin/bash -l


module load bioinfo-tools
module load snpEff


snpEff build -gtf22 -c bufo.config -v bufo


