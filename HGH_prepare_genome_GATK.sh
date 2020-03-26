#!/bin/bash

# index reference genome for bwa, create fasta indexes (fai and dict)

TMP=/workdir/$USER/tmp
GATKDIR=/programs/gatk-4.1.4.0
export PATH=$GATKDIR:$PATH

# cd genome

# Genome summary files needed and by GATK tools
gatk CreateSequenceDictionary -R Solidis_ref.fa  -O Solidis_ref.dict
samtools faidx Solidis_ref.fa

# index for BWA alignment
bwa index Solidis_ref.fa

# index image file needed by some Spark-based tools (if used)
gatk --java-options "-Djava.io.tmpdir=$TMP" BwaMemIndexImageCreator \
     -I Solidis_ref.fa \
     -O Solidis_ref.fa.img
