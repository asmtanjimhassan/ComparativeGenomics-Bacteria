##!/bin/bash

mkdir trimmed_reads
read1=data/target_R1.fastq.gz
read2=data/target_R2.fastq.gz
OutputForwardPaired=trimmed_reads/target_R1.fastq.gz    
OutputForwardUnpaired=trimmed_reads/target_unpaired_R1.fastq.gz
OutputReversePaired=trimmed_reads/target_R2.fastq.gz
OutputReverseUnpaired=trimmed_reads/target_unpaired_R2.fastq.gz
threads=16

trimmomatic PE -threads $threads $read1 $read2 \
$OutputForwardPaired $OutputForwardUnpaired \
$OutputReversePaired $OutputReverseUnpaired \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:true HEADCROP:3 TRAILING:10 MINLEN:25


#trim nanopore reads using porechop
#porechop -i data/P7741_minion.fastq -o trimmed_reads/target_minion.fastq --format fastq -t $threads


