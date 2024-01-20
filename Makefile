PREFIX= /usr/local
COPTS= -DFULLDEBUG
COPTS=
DEBUG= -g
DEBUG=
CFLAGS= ${COPTS} ${DEBUG}

deroff: deroff.o
	$(CC) ${CFLAGS} -o deroff deroff.o

deroff.o: deroff.c Makefile

clean:
	/bin/rm -f *.o deroff

install: deroff
	install deroff $(PREFIX)/bin
	install deroff.1 $(PREFIX)/share/man/man1

uninstall:
	/bin/rm -f $(PREFIX)/bin/deroff
	/bin/rm -f $(PREFIX)/share/man/man1/deroff.1
