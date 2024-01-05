include ../benchmarks.mk

TESTNAME = readers13

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 -DN=13 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
