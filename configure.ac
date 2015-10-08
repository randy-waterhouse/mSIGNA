dnl Copyright (c) 2015-2017 secureTXS (NZ) Ltd., All Rights Reserved.

dnl require autoconf 2.69
AC_PREREQ([2.69])
AC_INIT([mSIGNA], [0.9.5], [info@ciphrex.com],[mSIGNA],[https://github.com/ciphrex/mSIGNA])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([build-aux/m4])

AC_CANONICAL_HOST

dnl Checks for build programs.
AC_PROG_CXX
: ${CXXFLAGS=""}
AC_PROG_CC
: ${CFLAGS=""}
AC_PROG_CPP
: ${CPPFLAGS=""}
AC_PROG_INSTALL
AC_PROG_MAKE_SET

dnl Automake init set-up and checks
AM_INIT_AUTOMAKE([1.10 foreign subdir-objects])
m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

dnl Libtool init and settings
LT_PREREQ([2.2.4])
LT_INIT

dnl Check for pkg-config
PKG_PROG_PKG_CONFIG([0.25])

dnl Checks for header files.
AC_CHECK_HEADERS([fcntl.h inttypes.h limits.h malloc.h netinet/in.h stddef.h stdint.h stdlib.h string.h sys/file.h sys/ioctl.h sys/mount.h sys/param.h sys/statvfs.h sys/time.h unistd.h utime.h])

dnl Checks for typedefs, structures, and compiler characteristics.
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

dnl Checks for library functions.
AC_FUNC_ALLOCA
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_FUNC_STRERROR_R
AC_FUNC_STRTOD
AC_CHECK_FUNCS([clock_gettime fdatasync getpagesize getpass gettimeofday iswprint localtime_r memmove memset mkdir select socket strchr strerror strstr strtol strtoul strtoull utime])

dnl gcc and clang including version detection

AC_MSG_CHECKING([if compiling with clang])

AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
#ifndef __clang__
	not clang
#endif
	]])],[ac_cv_clang=true],[ac_cv_clang=false])

AC_MSG_RESULT([$ac_cv_clang])

if test x"$ac_cv_clang" == x"true"; then
	AC_MSG_CHECKING([if compiling with clang -std=c++11])
	AC_LANG_PUSH([C++])
	AC_COMPILE_IFELSE(
		[AC_LANG_PROGRAM([[#include <cinttypes>]],
			[[]])],
		[ac_cv_clang11=true],
		[ac_cv_clang11=false])
	AC_LANG_POP
	AC_MSG_RESULT([$ac_cv_clang11])
fi

if test x"$ac_cv_clang" == x"true"; then
	AC_MSG_CHECKING([if compiling with clang TR1])
	AC_LANG_PUSH([C++])
	   AC_COMPILE_IFELSE(
			 [AC_LANG_PROGRAM([[#include <tr1/memory>]],
				    [[]])],
			 [ac_cv_clangtr1=true],
			[ac_cv_clangtr1=false])
	AC_LANG_POP
	AC_MSG_RESULT([$ac_cv_clangtr1])
fi

if test x"$ac_cv_clang" == x"false"; then
	AC_MSG_CHECKING([whether gcc version is sufficient])
	gcc_major=0
	gcc_minor=0

	GCC_VERSION=`$CC -dumpversion`
	if test $? -eq 0; then
		gcc_major=`echo $GCC_VERSION | cut -d. -f1`
		gcc_minor=`echo $GCC_VERSION | cut -d. -f2`
	fi

	dnl test if we have a version of gcc that suports c++11
	ac_cv_gcc11=false

	if test $gcc_major -ge 4 -a $gcc_minor -ge 7 ; then
		ac_cv_gcc11=true
		AC_MSG_RESULT([yes, and supports c++11])
	elif test $gcc_major -ge 4 -a $gcc_minor -ge 6 ; then
		ac_cv_gcc11=false
		AC_MSG_RESULT([yes, but no c++11 support])
	else
		AC_MSG_ERROR([If using GCC, version 4.6.3 or later is required.])
		AC_MSG_RESULT([no])
	fi
fi

if test x"$ac_cv_clang" == x"true" -a x"$ac_cv_clang11" == x"false"; then
	ac_cv_cxx11=false
elif test x"$ac_cv_clang" == x"false" -a x"$ac_cv_gcc11" == x"false"; then
	ac_cv_cxx11=false
else
	ac_cv_cxx11=true
fi

dnl Checks for libraries.
# FIXME: Replace `main' with a function in `-lJsonRpc':
AC_CHECK_LIB([JsonRpc], [main])
# FIXME: Replace `main' with a function in `-lmswsock':
AC_CHECK_LIB([mswsock], [main])
# FIXME: Replace `main' with a function in `-lws2_32':
AC_CHECK_LIB([ws2_32], [main])

dnl pthread detection
AX_PTHREAD
CC="$PTHREAD_CC"

dnl OpenSSL detection
dnl "--with-openssl=DIR" point to optional openssl package/headers
AC_ARG_WITH(
	[openssl],
	[],
	[case "$withval" in "" | y | ye | yes | n | no) AC_MSG_ERROR([Invalid --with-openssl value]);;
		*) AX_CHECK_OPENSSL(
			[AC_MSG_RESULT([Custom openssl found!])],
			[AC_MSG_ERROR([Bad --with-openssl=DIR openssl not found in DIR])]);;
		esac],
	[PKG_CHECK_MODULES(
		[OPENSSL],
		[openssl >= 1.0.0],
		[],
		[AC_MSG_RESULT([Warning: openssl version >= 1.0.0 not found!])])])

dnl BOOST detection
AX_BOOST_BASE([1.49.0],[],[AC_MSG_ERROR([Boost >=1.49 not found!])])
AX_BOOST_FILESYSTEM
AX_BOOST_PROGRAM_OPTIONS
AX_BOOST_REGEX
AX_BOOST_SYSTEM
AX_BOOST_THREAD
AC_SUBST([BOOST_LIBS],["$BOOST_LDFLAGS $BOOST_FILESYSTEM_LIB $BOOST_PROGRAM_OPTIONS_LIB $BOOST_REGEX_LIB $BOOST_SYSTEM_LIB $BOOST_THREAD_LIB"])
AC_DEFINE([HAVE_BOOST], [1], [We have boost.])

dnl libodb, libodb-sqlite, sqlite3 package detection, ODB compiler call.
PKG_CHECK_MODULES([DB],[libodb libodb-sqlite sqlite3],[],[AC_MSG_ERROR([Error: odb packages not found!])])

AC_ARG_WITH(
	[odb],
	[AS_HELP_STRING(
		[--with-odb=PATH],
		[location of the odb compiler binary, defaults to odb])],
	[ODB="$withval"],
	[ODB='odb'])
AC_SUBST([ODB])

dnl libqrencode package detection
PKG_CHECK_MODULES([QRENCODE],[libqrencode >=3.4.2],[],[AC_MSG_RESULT([Warning: valid qrencode package not found!])])

dnl Build info and commit hash hack
COMMIT_HASH=$(git rev-parse HEAD)

echo "Building using commit hash $COMMIT_HASH..."
echo "#pragma once" > BuildInfo.h
echo "#define COMMIT_HASH \"$COMMIT_HASH\"" >> BuildInfo.h

dnl Build Configuration Options

dnl Standard build flag declarations (here for now)
AC_SUBST([STD_CXXFLAGS],['-std=c++0x'])

dnl -fvisibility=hidden -fvisibility-inlines-hidden

dnl (Option) Signal Handler
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

dnl (Option) Warnings
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
	["-Wall -Waddress -Woverloaded-virtual -Wshadow -Wconversion -Wextra -Wunused-parameter -Wunused-function -Wno-unknown-pragmas"])
fi

dnl (Option) Build In Debug or Release Mode
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
	if test x"$ac_cv_clang" == x"true"; then
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

dnl   Output to AM

AC_SUBST([DEPS_CFLAGS],	["$OPENSSL_CFLAGS $OPENSSL_INCLUDES $BOOST_CPPFLAGS $PTHREAD_CFLAGS"])

AC_SUBST([DEPS_LIBS],	["$OPENSSL_LDFLAGS $OPENSSL_LIBS $BOOST_LIBS $PTHREAD_LIBS"])

AC_SUBST([AM_CXXFLAGS],	["$STD_CXXFLAGS $DBG_CXXFLAGS $WARN_CXXFLAGS $REL_CXXFLAGS $DEPS_CFLAGS"])

AC_CONFIG_FILES([Makefile
                 deps/logger/Makefile
                 deps/sysutils/Makefile
                 deps/CoinCore/Makefile
                 deps/CoinQ/Makefile
                 deps/CoinDB/Makefile])

AC_OUTPUT

# Automatically identified existing Makefiles/makefiles/deps (need deprecating)
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
#                 tests/numberformats/Makefile
#                 tests/updates/Makefile
#                 vaultd/Makefile]
