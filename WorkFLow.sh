##fastqc on Raw data

fastqc SRR088897_1.fastq.gz SRR088897_2.fastq.gz

##cutadapt

cutadapt -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGC -B GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGC -q 30,30 -m 20 -o trimmed_1.fastq -p trimmed_2.fastq SRR088897_1.fastq.gz SRR088897_2.fastq.gz

##Quality Checking using Trimmed Data

fastqc trimmed_1.fastq trimmed_2.fastq

##calculate read statistics(to get average of fragment length and std deviatin of fragment length

sh script_for_read_stats.sh ##take average of both values you get for forward and reverse reads

##Assembly using Masurca

/home/arraygen/Downloads/MaSuRCA-3.3.3/bin/masurca sr_config_example.txt

./assemble.sh


##check assembly statistics of assembled Genome

assembly-stats /home/arraygen/Documents/Manju/WGS_Denovo/Masurca_Assembly/CA/final.genome.scf.fasta


##reassemble using ref Genome(Ragout)

##download ref Genome:https://www.ncbi.nlm.nih.gov/nuccore/NC_007795.1

##Running Ragout

ragout -o Reference cnf.rcp

##Annotation Using Prokka( input is the assembly you Got from Ragout)

prokka final_genome_scaffolds.fasta


##run circos


perl circos -conf config.conf -noparanoid

##Tandem repeat Finder

TRF /Ragout_final_poutput/final_genome_scf_scaffolds.fasta 2 5 7 80 10 80 2000 -l 3 -m -d

##Microsatellite Finding using MISA

/Downloads/misa_sourcecode_22092015/misa.pl /Ragout_final_poutput/final_genome_scf_scaffolds.fasta 









