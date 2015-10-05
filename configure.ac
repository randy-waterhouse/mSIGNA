dnl require autoconf 2.69
AC_PREREQ([2.69])
AC_INIT([mSIGNA], [0.9.5], [info@ciphrex.com])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([build-aux/m4])

AC_CANONICAL_HOST

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET

dnl Automake init set-up and checks
AM_INIT_AUTOMAKE([no-define subdir-objects foreign])

dnl Libtool init and settings
LT_INIT

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lCoinClasses':
AC_CHECK_LIB([CoinClasses], [main])
# FIXME: Replace `main' with a function in `-lCoinCore':
AC_CHECK_LIB([CoinCore], [main])
# FIXME: Replace `main' with a function in `-lCoinDB':
AC_CHECK_LIB([CoinDB], [main])
# FIXME: Replace `main' with a function in `-lCoinQ':
AC_CHECK_LIB([CoinQ], [main])
# FIXME: Replace `main' with a function in `-lJsonRpc':
AC_CHECK_LIB([JsonRpc], [main])
# FIXME: Replace `main' with a function in `-lWebSocketClient':
AC_CHECK_LIB([WebSocketClient], [main])
# FIXME: Replace `main' with a function in `-lWebSocketServer':
AC_CHECK_LIB([WebSocketServer], [main])
# FIXME: Replace `main' with a function in `-lboost_regex':
AC_CHECK_LIB([boost_regex], [main])
# FIXME: Replace `main' with a function in `-lcrypto':
AC_CHECK_LIB([crypto], [main])
# FIXME: Replace `main' with a function in `-llogger':
AC_CHECK_LIB([logger], [main])
# FIXME: Replace `main' with a function in `-lmswsock':
AC_CHECK_LIB([mswsock], [main])
# FIXME: Replace `main' with a function in `-lodb':
AC_CHECK_LIB([odb], [main])
# FIXME: Replace `main' with a function in `-lpthread':
AC_CHECK_LIB([pthread], [main])
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

AC_CONFIG_FILES([Makefile])

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
