#!/bin/bash

mkdir data
wget https://ftp.sra.ebi.ac.uk/vol1/fastq/ERR333/004/ERR3335734/ERR3335734_1.fastq.gz -O data/target_R1.fastq.gz
wget https://ftp.sra.ebi.ac.uk/vol1/fastq/ERR333/004/ERR3335734/ERR3335734_2.fastq.gz -O data/target_R2.fastq.gz
wget https://raw.githubusercontent.com/timflutre/trimmomatic/master/adapters/TruSeq3-PE.fa

mkdir apps
wget https://github.com/broadinstitute/pilon/releases/download/v1.24/pilon-1.24.jar -O apps/pilon.jar
#wget https://sra-pub-src-1.s3.amazonaws.com/ERR3335734/all_minion.fastq.1 -O data/target_minion.fastq

#wget https://github.com/ParBLiSS/FastANI/releases/download/v1.34/fastANI-linux64-v1.34.zip
#unzip fastANI-linux64-v1.34.zip

#sdir=$(which prokka)
#adir=$(dirname $sdir)
#mv fastANI $adir



