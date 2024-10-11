#!/bin/bash

mkdir MLST
fasta=target_reordered/target.reordered.fasta
mlst --csv $fasta  > MLST/mlst.csv


