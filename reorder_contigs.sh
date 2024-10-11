#!/bin/bash


#reference genome
ref=genomes/H37Rv.fasta

ragtag.py scaffold $ref polished_assembly/target.polished.fasta -o target_reordered


#extract the reordered contig with a custom python script
#the scripts accept name of the ragtag file containing the reordered contigs and accession number for the reference genome
#accession number is found in the first line of the reference genome fasta file

python extract_reordered.py target_reordered/ragtag.scaffold.fasta NC_000962.3

