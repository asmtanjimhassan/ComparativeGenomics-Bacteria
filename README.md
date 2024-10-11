# ComparativeGenomics-Bacteria
 The purpose of this repo is to provide scripts that one can quickly use to perform comparative analysis of bacterial genomes.

 #################  Comparative-Analysis-of-Bacterial-genomes  #################
Bioinformatics analysis can be challenging especially for new entrants. The purpose of this repo is to provide scripts that one can quickly use to perform comparative analysis of bacterial genomes. The scripts have been designed to automate majority of tasks so that beginners can get their hands dirty without having to struggle to assemble and use the analysis tools

#################

1. Add channels
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels defaults

2. Download the Analysis pipeline
git clone https://github.com/vappiah/bacterial-genomics-tutorial.git

3. Create conda environment.Packages are listed in the environment.yaml file.
conda env create -f environment.yaml

4. Activate the analysis environment
conda activate bacterialgenomics

5. Install python packages using pip
pip install -r pip-requirements.txt

6. Download the polishing tool pilon
mkdir apps
wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar -O apps/pilon.jar

7. Add permission to all scripts
chmod +x *.{py,sh,pl}

################ TIME FOR ANALYSIS ###################

Step 1: Download data.
./download_data.sh

Step 2: Perform QC on the raw reads
./qc_raw_reads.sh (fastQC)

Step 3: Trim reads using sickle
./trim_reads.sh (trimmomatic)

Step 4: Perform QC on the trimmed reads
 ./qc_trimmed_reads.sh (fastQC)

Step 5: Perform de novo assembly using spades
./assemble.sh (SPAdes)
https://github.com/ablab/spades

Step 6 : Polish the draft assembly using pilon
This is meant to improve the draft assembly. The scaffolds will be used. You can also modify the script to use the contigs and compare the result
./polish.sh (bwa, samtools, pilon)

Step 7: Perform QC for both raw assembly and polished assembly
./qc_assembly.sh (quast)

Step 8: Generate draft genome by reordering contigs against a reference genome using ragtag\
./reorder_contigs.sh (RagTag)

Step 9: Perform a multi locus sequence typing using MLST software\
./mlst.sh (MLST)

Step 10: Check for antimicrobial resistance genes using abricate\
./amr.sh (abricate)

Step 11: Annotate the draft genome using prokka
./annotate.sh (prokka)

Step 12: Get some statistics on the annotation.
Features such as genes, CDS will be counted and displayed.
The scripts requires you to specify the folder where annotations were saved . 
i.e. "target" Python should be used to run that script

python get_annot_stats.py target_annotation target

Step 13: Generate dendogram using dREP\
./dendogram.sh

Step 14: Perform Pangenome Analysis using Roary.
Input files are gff (version 3 ) format. It is recommended to use prokka generated gff.
So we generate the gffs for the files in the genome folder by reannotating with prokka.
We use the get_genome_gffs script

./get_genome_gffs.sh 

Then perform pangenome analysis\

./get_pangenome.sh

Step 15: Get gene summary for three of the organism. the default is P7741 Agy99 and Liflandii.
Feel free to change it. A venn diagram will be generated(gene_count_summary.png)
python gene_count_summary.py P7741 Agy99 Liflandii pangenome/gene_presence_absence.csv

Step 16: Circular Comparison with BRIG
 ./circular_comparison.sh

If you are working on a cluster you will want to combine the analysis results into a zip file for download and view locally. 
./zip_results.sh

Step 17: Result interpretation
The result interpretation are available on this youtube video tutorial : https://youtu.be/S_sRo_85jhs
