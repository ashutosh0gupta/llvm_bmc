include ../benchmarks.mk

TESTNAME = indexer12

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=12 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
