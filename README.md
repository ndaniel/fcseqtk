Introduction
------------

Seqtkfc is a fast and lightweight tool for processing sequences in the FASTA or
FASTQ format. It seamlessly parses both FASTA and FASTQ files which can also be
optionally compressed by gzip. Seqtkfc is fork of seqtk which was adapted for
use with FusionCatcher.

Seqtkfc Examples
--------------

* Convert FASTQ to FASTA:

        seqtkfc seq -a in.fq.gz > out.fa

* Convert ILLUMINA 1.3+ FASTQ to FASTA and mask bases with quality lower than 20 to lowercases (the 1st command line) or to `N` (the 2nd):

        seqtkfc seq -aQ64 -q20 in.fq > out.fa
        seqtkfc seq -aQ64 -q20 -n N in.fq > out.fa

* Fold long FASTA/Q lines and remove FASTA/Q comments:

        seqtkfc seq -Cl60 in.fa > out.fa

* Convert multi-line FASTQ to 4-line FASTQ:

        seqtkfc seq -l0 in.fq > out.fq

* Reverse complement FASTA/Q:

        seqtkfc seq -r in.fq > out.fq

* Extract sequences with names in file `name.lst`, one sequence name per line:

        seqtkfc subseq in.fq name.lst > out.fq

* Extract sequences in regions contained in file `reg.bed`:

        seqtkfc subseq in.fa reg.bed > out.fa

* Mask regions in `reg.bed` to lowercases:

        seqtkfc seq -M reg.bed in.fa > out.fa

* Subsample 10000 read pairs from two large paired FASTQ files (remember to use the same random seed to keep pairing):

        seqtkfc sample -s100 read1.fq 10000 > sub1.fq
        seqtk sample -s100 read2.fq 10000 > sub2.fq

* Trim low-quality bases from both ends using the Phred algorithm:

        seqtkfc trimfq in.fq > out.fq

* Trim 5bp from the left end of each read and 10bp from the right end:

        seqtkfc trimfq -b 5 -e 10 in.fa > out.fa

* Keep first 50bp from the left end of each read by trimming the right end:

        seqtkfc trimfq -B 50 in.fq > out.fq

* Keep last 50bp from the right end of each read by trimming the left end:

        seqtkfc trimfq -E 50 in.fq > out.fq

* Trim 5bp from left end and keep next 50bp from left end of each read:

        seqtkfc trimfq -B 50 -b 5 in.fq > out.fq

* Trim 5bp from right end and keep the 50bp from right end of each read:

        seqtkfc trimfq -E 50 -e 5 in.fq > out.fq

* Trim 5bp from right end and keep the 50bp from right end of each read and if trimmed read length ends up having less the 20bp then the first 20 bp should be kept only:

        seqtkfc trimfq -E 50 -e 5 -l 20 in.fq > out.fq

