include ../benchmarks.mk

TESTNAME = ainc7

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -DN=7 -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
