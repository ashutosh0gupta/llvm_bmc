include ../benchmarks.mk

TESTNAME = ainc6

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -DN=6 -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
