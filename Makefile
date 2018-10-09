BINDIR=bin
SRCDIR=src
MAIN_SRC=$(SRCDIR)/Main.hs
OPT_OUT=-odir $(BINDIR) -hidir $(BINDIR)
OPT_INCLUDE=-i$(SRCDIR)

all: agave

agave:
	mkdir -p $(BINDIR)
	ghc $(OPT) $(OPT_INCLUDE) $(OPT_OUT) -o $(BINDIR)/agave $(MAIN_SRC)

clean:
	rm -rf $(BINDIR)
