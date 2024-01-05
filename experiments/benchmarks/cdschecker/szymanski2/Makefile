include ../benchmarks.mk

TESTNAME = szymanski2

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) -std=c11 $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
