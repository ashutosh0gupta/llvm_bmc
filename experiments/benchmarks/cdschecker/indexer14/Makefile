include ../benchmarks.mk

TESTNAME = indexer14

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=14 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
