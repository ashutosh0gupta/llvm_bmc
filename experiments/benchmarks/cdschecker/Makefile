DIRS := barrier mcs-lock mpmc-queue spsc-queue spsc-bugfix linuxrwlocks \
	dekker-fences chase-lev-deque ms-queue chase-lev-deque-bugfix seqlock \
	treiber-stack cliffc-hashtable concurrent-hashmap \
	2CoWR ainc3 ainc4 ainc5 ainc6 ainc7 big0 big1 binc3 binc4 binc5 casrot3 \
	casrot4 casrot5 casrot6 casrot8 casw3 casw4 casw5 casw6 cii CoA2 CoRR1 \
	CoRR2 CoRR CoRW CoWR fib_bench JLT indexer12 indexer13 indexer14 \
	indexer15 lastzero5 lastzero10 lastzero15 LB+incMPs LB MP MP+incMP ori \
	readers3 readers5 readers8 readers10 readers13 readers15 rii riwi rw4 SB \
	small0 small1 wainc3 wcas3 wcii wrw3 2+2W \
	nwrites5 nwrites10 nwrites20 lamp-dart2 parker10 parker40 parker70 \
	peterson10 peterson40 peterson70 szymanski2 nwrites-loc5 nwrites-loc10 \
	nwrites-loc15 nwrites-loc20

.PHONY: $(DIRS)

all: $(DIRS)

clean: $(DIRS:%=clean-%)

$(DIRS):
	$(MAKE) -C $@

clean-%:
	-$(MAKE) -C $* clean
