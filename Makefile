CC=gcc
CFLAGS=-g -Wall -O2 -Wno-unused-function

all:seqtkfc trimadap

seqtk:seqtkfc.c khash.h kseq.h
		$(CC) $(CFLAGS) seqtkfc.c -o $@ -lz -lm

trimadapfc:trimadapfc.c kseq.h ksw.h
		$(CC) $(CFLAGS) ksw.c trimadap.c -o $@ -lz -lm

clean:
		rm -fr gmon.out *.o ext/*.o a.out seqtkfc trimadapfc *~ *.a *.dSYM session*
