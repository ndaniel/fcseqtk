CC=gcc
CFLAGS=-g -Wall -O2 -Wno-unused-function

all:seqtkfc

seqtkfc:seqtkfc.c khash.h kseq.h
		$(CC) $(CFLAGS) seqtkfc.c -o $@ -lz -lm

clean:
		rm -fr gmon.out *.o ext/*.o a.out seqtkfc *~ *.a *.dSYM session*
