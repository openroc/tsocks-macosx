# Makefile used by configure to create real Makefile

CC=gcc
SHLIB_EXT=dylib
prefix=/usr
exec_prefix = ${prefix}
libexecdir = ${exec_prefix}/libexec
sysconfdir = ${prefix}/etc
libdir = /usr/lib
bindir = ${exec_prefix}/bin
infodir = ${prefix}/share/info
mandir = ${prefix}/share/man
includedir = ${prefix}/include

SHELL = /bin/sh
MKINSTALLDIRS = ${SHELL} mkinstalldirs 
SHCC = ${CC} -fPIC 
INSPECT = inspectsocks
SAVE = saveme
LIB_NAME = libtsocks
COMMON = common
PARSER = parser
VALIDATECONF = validateconf
SCRIPT = tsocks
SHLIB_MAJOR = 1
SHLIB_MINOR = 8
SHLIB = ${LIB_NAME}.${SHLIB_EXT}.${SHLIB_MAJOR}.${SHLIB_MINOR}

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
CFLAGS = -g -O2 -Wall
LDFLAGS =  -dynamiclib -multiply_defined suppress -single_module
INCLUDES = -I.
LIBS =  -lc
SPECIALLIBS = -ldl 

SHOBJS = ${OBJS:.o=.so}

OBJS= tsocks.o

TARGETS= ${SHLIB} ${UTIL_LIB} ${SAVE} ${INSPECT} ${VALIDATECONF}

all: ${TARGETS}

${VALIDATECONF}: ${VALIDATECONF}.c ${COMMON}.o ${PARSER}.o
	${SHCC} ${CFLAGS} ${INCLUDES} -o ${VALIDATECONF} ${VALIDATECONF}.c ${COMMON}.o ${PARSER}.o ${LIBS}

${INSPECT}: ${INSPECT}.c ${COMMON}.o
	${SHCC} ${CFLAGS} ${INCLUDES} -o ${INSPECT} ${INSPECT}.c ${COMMON}.o ${LIBS} 

${SAVE}: ${SAVE}.c
	${SHCC} ${CFLAGS} ${INCLUDES} -o ${SAVE} ${SAVE}.c

${SHLIB}: ${OBJS} ${COMMON}.o ${PARSER}.o
	${SHCC} ${CFLAGS} ${INCLUDES} -nostdlib ${LDFLAGS} -o ${SHLIB} ${OBJS} ${COMMON}.o ${PARSER}.o ${DYNLIB_FLAGS} ${SPECIALLIBS} ${LIBS}
	ln -sf ${SHLIB} ${LIB_NAME}.${SHLIB_EXT}

%.so: %.c
	${SHCC} ${CFLAGS} ${INCLUDES} -c ${CC_SWITCHES} $< -o $@

%.o: %.c
	${SHCC} ${CFLAGS} ${INCLUDES} -c ${CC_SWITCHES} $< -o $@

install: ${TARGETS} installscript installlib installman

installscript:
	${MKINSTALLDIRS} "${DESTDIR}${bindir}"
	${INSTALL} ${SCRIPT} ${DESTDIR}${bindir}

installlib:
	${MKINSTALLDIRS} "${DESTDIR}${libdir}"
	${INSTALL} ${SHLIB} ${DESTDIR}${libdir}
	ln -sf ${SHLIB} ${DESTDIR}${libdir}/${LIB_NAME}.${SHLIB_EXT}.${SHLIB_MAJOR}
	ln -sf ${LIB_NAME}.${SHLIB_EXT}.${SHLIB_MAJOR} ${DESTDIR}${libdir}/${LIB_NAME}.${SHLIB_EXT}

installman:
	${MKINSTALLDIRS} "${DESTDIR}${mandir}/man1"
	${INSTALL_DATA} tsocks.1 ${DESTDIR}${mandir}/man1/
	${MKINSTALLDIRS} "${DESTDIR}${mandir}/man8"
	${INSTALL_DATA} tsocks.8 ${DESTDIR}${mandir}/man8/
	${MKINSTALLDIRS} "${DESTDIR}${mandir}/man5"
	${INSTALL_DATA} tsocks.conf.5 ${DESTDIR}${mandir}/man5/
	
clean:
	-rm -f *.so *.so.* *.dylib *.dylib.* *.o *~ ${TARGETS}

distclean: clean
	-rm -f config.cache config.log config.h Makefile
