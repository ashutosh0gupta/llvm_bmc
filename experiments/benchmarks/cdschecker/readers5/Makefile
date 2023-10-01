include ../benchmarks.mk

TESTNAME = readers5

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=5 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
