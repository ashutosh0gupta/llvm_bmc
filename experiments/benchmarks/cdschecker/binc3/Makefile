include ../benchmarks.mk

TESTNAME = binc3

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -DN=3 -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
