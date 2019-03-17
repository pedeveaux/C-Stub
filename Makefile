COMPILE = gcc -std=gnu11
LINK = gcc
CFLAGS = -I. -g3 -Wall -Werror -O3
CLEANUP = rm -f
ASAN_FLAGS = -fsanitize=address -fno-omit-frame-pointer -Wno-format-security

SOURCES = $(wildcard src/**/*.c src/*.c)
OBJECTS = $(patsubst %.c,%.o,$(SOURCES))
EXECS = hello

PATHS = src/
PATHB = build/
PATHT = test/
PATHO = build/objs/

# hello is the source .c file
$(EXECS): 
	$(COMPILE) $(CFLAGS) $(ASAN_FLAGS) $(SOURCES) $< -o $@

.PHONY: clean

clean:
	$(CLEANUP) $(PATHO)*.o
	$(CLEANUP) hello