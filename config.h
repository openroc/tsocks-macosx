/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated automatically from configure.in by autoheader.  */

/* Define if you have the ANSI C header files.  */
#define STDC_HEADERS 1

/* Allow tsocks to generate messages to stderr when errors are
encountered, this is really important and should only be disabled if
you're REALLY sure. It can also be turned off at run time, see the man
page for details */
#define ALLOW_MSG_OUTPUT 1

/* Allow TSOCKS_CONF_FILE in environment to specify config file 
location */
#define ALLOW_ENV_CONFIG 1

/* Use _GNU_SOURCE to define RTLD_NEXT, mostly for RH7 systems */
/* #undef USE_GNU_SOURCE */

/* dlopen() the old libc to get connect() instead of RTLD_NEXT, 
hopefully shouldn't be needed */
/* #undef USE_OLD_DLSYM */

/* path to library containing connect(), needed if USE_OLD_DLSYM is enabled */
/* #undef LIBCONNECT */

/* path to libc, needed if USE_OLD_DLSYM is enabled */
/* #undef LIBC */

/* Configure the system resolver to use TCP queries on startup, this
allows socksified DNS */
/* #undef USE_SOCKS_DNS */

/* Prototype and function header for connect function */
#define CONNECT_SIGNATURE int __fd, const struct sockaddr * __addr, socklen_t __len

/* The type of socket structure pointer to use to call the 
 * real connect */
#define CONNECT_SOCKARG struct sockaddr *

/* Prototype and function header for select function */
#define SELECT_SIGNATURE int n, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout

/* Prototype and function header for poll function */
#define POLL_SIGNATURE struct pollfd *ufds, nfds_t nfds, int timeout

/* Prototype and function header for close function */
#define CLOSE_SIGNATURE int fd

/* Work out which function we have for conversion from string IPs to 
numerical ones */
/* #undef HAVE_INET_ADDR */
#define HAVE_INET_ATON 1

/* Allow the use of DNS names in the socks configuration file for socks
servers. This doesn't work if socksified DNS is enabled for obvious
reasons, it also introduces overhead, but people seem to want it */
#define HOSTNAMES 1

/* We need the gethostbyname() function to do dns lookups in tsocks or 
in inspectsocks */
#define HAVE_GETHOSTBYNAME 1

/* Location of configuration file (typically /etc/tsocks.conf) */
#define CONF_FILE "/etc/tsocks.conf"

/* Define if you have the strcspn function.  */
#define HAVE_STRCSPN 1

/* Define if you have the strdup function.  */
#define HAVE_STRDUP 1

/* Define if you have the strerror function.  */
#define HAVE_STRERROR 1

/* Define if you have the strspn function.  */
#define HAVE_STRSPN 1

/* Define if you have the strtol function.  */
#define HAVE_STRTOL 1

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1

/* Define if you have the dl library (-ldl).  */
#define HAVE_LIBDL 1

/* Define if you have the socket library (-lsocket).  */
/* #undef HAVE_LIBSOCKET */
