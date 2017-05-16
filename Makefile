RPM_OPT_FLAGS ?= -O2 -g -Wall
all: lz4writer
lz4writer: main.o liblz4writer.a
	$(CC) $(RPM_OPT_FLAGS) -o $@ $^ -llz4
liblz4writer.a: lz4writer.o
	$(AR) r $@ $^
main.o: main.c lz4writer.h
	$(CC) $(RPM_OPT_FLAGS) -c $<
lz4writer.o: lz4writer.c lz4writer.h lz4fix.h
	$(CC) $(RPM_OPT_FLAGS) -c $<
clean:
	rm -f lz4writer.o liblz4writer.a main.o lz4writer
