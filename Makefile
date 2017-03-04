CC=gcc
CFLAGS=-g -Wall -O2 -Wno-unused-function

all:fcseqtk

fcseqtk:fcseqtk.c khash.h kseq.h
		$(CC) $(CFLAGS) fcseqtk.c -o $@ -lz -lm

clean:
		rm -fr gmon.out *.o ext/*.o a.out fcseqtk *~ *.a *.dSYM session*
