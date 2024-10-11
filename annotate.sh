#!/bin/bash
#Genome annotation using prokka

#if you have more cpus you can increase the number of cpus
cpus=8

prokka --cpus $cpus --kingdom Bacteria --locustag target --outdir target_annotation --prefix target --addgenes target_reordered/target.reordered.fasta
./get_pseudo.pl target_annotation/target.faa | tee target_annotation/target.pseudo.txt
