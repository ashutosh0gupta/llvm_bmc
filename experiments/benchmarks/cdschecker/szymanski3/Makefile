include ../benchmarks.mk

TESTNAME = szymanski3

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
