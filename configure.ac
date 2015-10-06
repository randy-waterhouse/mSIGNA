dnl require autoconf 2.69
AC_PREREQ([2.69])
AC_INIT([mSIGNA], [0.9.5], [info@ciphrex.com])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([build-aux/m4])

AC_CANONICAL_HOST

dnl Checks for build programs.
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_CXX
AC_PROG_CC
AC_PROG_CPP
: ${CXXFLAGS=""}
: ${CFLAGS=""}
: ${CPPFLAGS=""}

dnl Automake init set-up and checks
AM_INIT_AUTOMAKE([1.10 no-define subdir-objects foreign])
m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

dnl Libtool init and settings
LT_INIT

dnl Check for pkg-config
PKG_PROG_PKG_CONFIG([0.25])

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lJsonRpc':
AC_CHECK_LIB([JsonRpc], [main])
# FIXME: Replace `main' with a function in `-lcrypto':
AC_CHECK_LIB([crypto], [main])
# FIXME: Replace `main' with a function in `-llogger':
AC_CHECK_LIB([logger], [main])
# FIXME: Replace `main' with a function in `-lmswsock':
AC_CHECK_LIB([mswsock], [main])
# FIXME: Replace `main' with a function in `-lodb':
AC_CHECK_LIB([odb], [main])
# FIXME: Replace `main' with a function in `-lsysutils':
AC_CHECK_LIB([sysutils], [main])
# FIXME: Replace `main' with a function in `-lws2_32':
AC_CHECK_LIB([ws2_32], [main])

# Checks for header files.
AC_CHECK_HEADERS([fcntl.h inttypes.h limits.h malloc.h netinet/in.h stddef.h stdint.h stdlib.h string.h sys/file.h sys/ioctl.h sys/mount.h sys/param.h sys/statvfs.h sys/time.h unistd.h utime.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_TYPE_UID_T
AC_C_INLINE
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_INT8_T
AC_TYPE_MODE_T
AC_TYPE_OFF_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_CHECK_MEMBERS([struct stat.st_blksize])
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T
AC_TYPE_UINT8_T

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_FUNC_STRERROR_R
AC_CHECK_FUNCS([clock_gettime fdatasync getpagesize gettimeofday iswprint localtime_r memmove memset select socket strchr strerror strstr strtol strtoul strtoull utime])

## pthread detection ##
AX_PTHREAD
CC="$PTHREAD_CC"

## BOOST detection
AX_BOOST_BASE([1.25.0])
AX_BOOST_FILESYSTEM
AX_BOOST_PROGRAM_OPTIONS
AX_BOOST_REGEX
AX_BOOST_SYSTEM
AX_BOOST_THREAD
AC_SUBST([BOOST_LIBS],["$BOOST_LDFLAGS $BOOST_FILESYSTEM_LIB $BOOST_PROGRAM_OPTIONS_LIB $BOOST_REGEX_LIB $BOOST_SYSTEM_LIB $BOOST_THREAD_LIB"])
AC_DEFINE([HAVE_BOOST], [1], [We are go for boost])

## Standard build flag declaration (here for now)
AC_SUBST([STD_CXXFLAGS],['-std=c++0x -DBOOST_SYSTEM_NOEXCEPT=""'])


##############################
## Build Configuration Options

## (Option) Signal Handler ##

AC_ARG_ENABLE(
	sighandler,
	AS_HELP_STRING(
		[--enable-sighandler],
		[enable sighandler, default: no]),
	[case "${enableval}" in
		yes)	sighandler=true ;;
		no)	sighandler=false ;;
		*)	AC_MSG_ERROR([bad value ${enableval} for --disable-sighandler]) ;;
		esac],
	[sighandler=false])

AM_CONDITIONAL(ENABLE_SIGNAL_HANDLING, test x"$sighandler" == x"true")

if test x"$sighandler" == x"true"; then
	AC_DEFINE([SIGNAL_HANDLING], [1], [Using Signal Handling])
fi

## (Option) Warnings ##

AC_ARG_ENABLE(
	warnings,
	AS_HELP_STRING(
		[--enable-warnings],
		[enable warnings, default: no]),
	[case "${enableval}" in
		yes) warnings=true ;;
		no)  warnings=false ;;
		*)   AC_MSG_ERROR([bad value ${enableval} for --enable-warnings]) ;;
		esac],
	[warnings=false])

AM_CONDITIONAL(ENABLE_WARNINGS, test x"$warnings" == x"true")

if test x"$warnings" == x"true"; then

	AC_SUBST([WARN_CXXFLAGS],
	["-Wall -Waddress -Woverloaded-virtual -Wshadow -Wconversion -Wno-unknown-pragmas"])
fi

## (Option) Build In Release Mode ##

AC_ARG_ENABLE([debug],
	AS_HELP_STRING([--enable-debug],[enable debug, default: no]),
	[case "${enableval}" in
		yes) debug=true ;;
		no)  debug=false ;;
		*)   AC_MSG_ERROR([bad value ${enableval} for --enable-debug]) ;;
		esac],[debug=false])
AM_CONDITIONAL([ENABLE_DEBUG], [test x$debug == x"true"])


AC_ARG_ENABLE([release],
	AS_HELP_STRING([--enable-release],[enable release, default: no]),
	[case "${enableval}" in
		yes) release=true ;;
		no)  release=false ;;
		*)   AC_MSG_ERROR([bad value ${enableval} for --enable-release]) ;;
		esac],[release=false])
AM_CONDITIONAL([ENABLE_RELEASE], [test x$release == x"true"])

if test x"$debug" == x"true" -a x"$release" == x"true"; then
	AC_MSG_ERROR([You must not set both release and debug modes! (remove either: --enable-debug or --enable-release).])
fi

if test x"$debug" == x"false" -a x"$release" == x"false"; then
	AC_MSG_RESULT([defaulting to RELEASE mode!])
	release=true
	AM_CONDITIONAL([ENABLE_RELEASE], [test x$release == x"true"])
fi

if test x"$debug" == x"true"; then
	if test x"$ac_cv_ot_clang" == x"true"; then
		AC_SUBST([DBG_CXXFLAGS],["-g3 -O0 -fPIC"])
	else
		AC_SUBST([DBG_CXXFLAGS],["-g3 -O0 -fPIC -DPIC"])
	fi
	AC_DEFINE([DEBUG], [1], [Building in Debug Mode])
fi

if test x"$release" == x"true"; then
	if test x"$ac_cv_clang" == x"true"; then
		AC_SUBST([REL_CXXFLAGS],["-g0 -O3 -fPIC -D_FORTIFY_SOURCE=2"])
	else
		AC_SUBST([REL_CXXFLAGS],["-g0 -O0 -fPIC -D_FORTIFY_SOURCE=2 --param ssp-buffer-size=4 -fstack-protector-all -fstack-check -Wstack-protector"])
	fi
	AC_DEFINE([RELEASE], [1], [Building in Release Mode])
fi


#####   Output to AM   #####
#AC_SUBST([DEPS_CFLAGS],	["$OPENSSL_CFLAGS $OPENSSL_INCLUDES $BOOST_CPPFLAGS $PTHREAD_CFLAGS"])

AC_SUBST([DEPS_LIBS],	["$OPENSSL_LDFLAGS $OPENSSL_LIBS $BOOST_LIBS -ldl $PTHREAD_LIBS"])

AC_SUBST([AM_CXXFLAGS],	["$STD_CXXFLAGS $DBG_CXXFLAGS $REL_CXXFLAGS $WARN_CXXFLAGS"])

AC_CONFIG_FILES([Makefile deps/CoinCore/Makefile deps/CoinQ/Makefile deps/CoinDB/Makefile])

# Automatically identified existing Makefiles/makefiles (need deprecating)
#                 deps/CoinCore/examples/hdkeychain/Makefile
#                 deps/CoinCore/examples/keygen/makefile
#                 deps/CoinCore/examples/listener/makefile
#                 deps/CoinCore/examples/listener2/makefile
#                 deps/CoinCore/examples/nodecrawler/makefile
#                 deps/CoinCore/examples/ping/makefile
#                 deps/CoinCore/examples/rawtx/makefile
#                 deps/CoinCore/examples/txbuilder/makefile
#                 deps/CoinCore/tests/aes/Makefile
#                 deps/CoinCore/tests/bip39/Makefile
#                 deps/CoinCore/tests/hdwallets/Makefile
#                 deps/CoinCore/tests/partialmerkletree/Makefile
#                 deps/CoinCore/tests/secp256k1/Makefile
#                 deps/CoinQ/examples/clivault/Makefile
#                 deps/CoinQ/examples/netsync/Makefile
#                 deps/CoinQ/examples/peer/Makefile
#                 deps/Signals/test/Makefile
#                 deps/WebSocketClient/Makefile
#                 deps/logger/examples/simple/Makefile
#                 deps/sqlite3/Makefile
#                 tests/numberformats/Makefile
#                 tests/updates/Makefile
#                 vaultd/Makefile]
       
##AC_CONFIG_SUBDIRS([deps/qrencode-3.4.3])
AC_OUTPUT
