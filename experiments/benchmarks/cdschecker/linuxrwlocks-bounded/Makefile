include ../benchmarks.mk

TESTNAME = linuxrwlocks-bounded

all: $(TESTNAME)

$(TESTNAME): $(TESTNAME).c
	$(CC) -o $@ $< $(CFLAGS) $(LDFLAGS)

clean:
	rm -f $(TESTNAME) *.o
