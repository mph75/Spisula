#!/bin/bash

REFFASTA=Solidis_ref.fa

# Un-comment one of the accession/sample pair below to run alignment for this sample

#ACC=$1
#SAM=$2

ACC=Sol
SAM=Solidissima

#ACC=SRR1663609
#SAM=ZW177

#ACC=SRR1663610
#SAM=ZW184

#ACC=SRR1663611
#SAM=ZW185

# bwa will run on 20 CPUs (-t 20)

echo Alignment started
date

bwa mem -M -t 20 \
-R "@RG\tID:${ACC}\tSM:${SAM}\tLB:${SAM}\tPL:ILLUMINA" $REFFASTA \
${ACC}_R1.fq.gz  ${ACC}_R2.fq.gz \
| samtools view -Sb - > $ACC.bam

echo Alignment finished
date
