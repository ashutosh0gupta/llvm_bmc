include ../benchmarks.mk

TESTNAME = nwrites5

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
