include ../benchmarks.mk

TESTNAME = readers8

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=8 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
