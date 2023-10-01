include ../benchmarks.mk

TESTNAME = readers10

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=10 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
