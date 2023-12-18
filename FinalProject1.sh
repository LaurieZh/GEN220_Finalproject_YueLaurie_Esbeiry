#!/bin/bash -l
#Downloading PhoD and gcd sequences from NCBI
wget -O PhoD.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?id=NZ_CP051464.1&db=nuccore&report=fasta&from=275909&to=277660"
wget -O gcd.fasta "https://www.ncbi.nlm.nih.gov/nuccore/NZ_CP055055.1?report=fasta&from=744990&to=747380&strand=true"

# combining PhoD and gcd sequences
cat PhoD.fasta gcd.fasta > Pgenes.fasta

#creating Database
makeblastdb -in Pgenes.fasta -dbtype nucl -parse_seqids -out PgenesDB.fasta

#Blast query
blastn -query CNF2NT1_contigs.fa -db PgenesDB.fasta -evalue 0.001 -outfmt 6 -out CNF2NT1_b.BLASTN.tab

blastn -query CNF2NT9_contigs.fa -db PgenesDB.fasta -evalue 0.001 -outfmt 6 -out CNF2NT9_b.BLASTN.tab

blastn -query CNF8NT1_contigs.fa -db PgenesDB.fasta -evalue 0.001 -outfmt 6 -out CNF8NT1_b.BLASTN.tab

blastn -query CNF8NT9_contigs.fa -db PgenesDB.fasta -evalue 0.001 -outfmt 6 -out CNF8NT9_b.BLASTN.tab





