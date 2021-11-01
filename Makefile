SRC=src
FILENAME=senso

all:
	$(MAKE) -C $(SRC) all 

install: all
	$(MAKE) -C $(SRC) install

.Phony: run 
run: install
	bin/$(FILENAME)

.Phony: clean
clean:
	$(MAKE) -C $(SRC) clean

.Phony: distclean
distclean: clean
	rm -rf bin
