ODIR = obj
SRC = src

DEPS = $(wildcard $(SRC)/*.h)

_OBJS := $(patsubst %.c,%.o,$(wildcard $(SRC)/*.c))
OBJS := $(patsubst $(SRC)/%,$(ODIR)/%,$(_OBJS))

all: compiler

compiler: $(OBJS)
	gcc -o $@ $^

$(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	gcc -c -o $@ $<

.PHONY: clean

clean:
	rm -rf obj/*.o compiler
