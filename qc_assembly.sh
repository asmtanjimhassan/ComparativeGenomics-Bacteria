#!/bin/bash


mkdir QC_ASSEMBLY
quast.py -o QC_ASSEMBLY -R genomes/H37Rv.fasta target_SPADES_OUT/scaffolds.fasta polished_assembly/target.polished.fasta
