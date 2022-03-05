PREFIX  := /usr/local
CC      := cc
CFLAGS  := -pedantic -Wall -Wno-deprecated-declarations -Os
LDFLAGS := -lX11

# FreeBSD (uncomment)
#LDFLAGS += -L/usr/local/lib -I/usr/local/include
# # OpenBSD (uncomment)
#LDFLAGS += -L/usr/X11R6/lib -I/usr/X11R6/include

all: options dwmblocks

options:
	@echo dwmblocks build options:
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "CC      = ${CC}"

dwmblocks: dwmblocks.c blocks.h
	${CC} -o dwmblocks dwmblocks.c ${CFLAGS} ${LDFLAGS}

clean:
	rm -f *.o *.gch dwmblocks

install: dwmblocks
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f dwmblocks ${DESTDIR}${PREFIX}/bin
	cp -rf scripts/* ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/dwmblocks
	chmod 755 ${DESTDIR}${PREFIX}/bin/clock
	chmod 755 ${DESTDIR}${PREFIX}/bin/kernel
	chmod 755 ${DESTDIR}${PREFIX}/bin/memory
	chmod 755 ${DESTDIR}${PREFIX}/bin/volume
	chmod 755 ${DESTDIR}${PREFIX}/bin/upt

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwmblocks
	rm -f ${DESTDIR}${PREFIX}/bin/clock
	rm -f ${DESTDIR}${PREFIX}/bin/kernel
	rm -f ${DESTDIR}${PREFIX}/bin/memory
	rm -f ${DESTDIR}${PREFIX}/bin/volume
	rm -f ${DESTDIR}${PREFIX}/bin/upt

.PHONY: all options clean install uninstall
