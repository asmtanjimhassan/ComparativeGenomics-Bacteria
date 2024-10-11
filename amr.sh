#!/bin/bash

mkdir AMR
abricate target_reordered/target.reordered.fasta > AMR/amr.summary.tab
cat AMR/amr.summary.tab
