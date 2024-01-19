COPTS=
DEBUG= -g
CFLAGS= ${COPTS} ${DEBUG}

deroff: deroff.o
	$(CC) ${CFLAGS} -o deroff deroff.o

install: deroff
