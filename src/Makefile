CC = gcc
INCLUDE = -I../include
CFLAGS = -std=gnu11 -pedantic -Wall
LDFLAGS =
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
DEBUG =
GPIO_MODE = terminal
FILENAME = senso

all: gpio $(FILENAME)

$(FILENAME): $(OBJECTS)
	$(CC) -o $@  $^ gpio.o $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(DEBUG) -c $^ -o $@ $(INCLUDE)

gpio:
	$(CC) $(CFLAGS) $(DEBUG) -c $(GPIO_MODE)/gpio.c -o gpio.o $(INCLUDE)

install: all
	mkdir -p ../bin/
	cp $(FILENAME) ../bin/

.Phony: clean
clean:
	rm -f *.o $(FILENAME)
	
.Phony: run
run: install 
	../bin/$(FILENAME)
