lib_LTLIBRARIES		=	libCoinDB.la

libCoinDB_la_CXXFLAGS	=	$(AM_CXXFLAGS) -Isrc -I../include "-DDATABASE_SQLITE"

libCoinDB_la_SOURCES	=	$(CoinDB_sources) $(logger_sources) $(sysutils_sources)

libCoinDB_la_LIBADD	=	$(top_builddir)/deps/CoinCore/libCoinCore.la	\
                                $(top_builddir)/deps/CoinQ/libCoinQ.la		\
                                $(DEPS_LIBS) -lcrypto -lodb-sqlite -lodb -lsqlite3

#libCoinDB_la_DEPENDENCIES	= $(top_builddir)/deps/CoinCore/libCoinCore.la

#libCoinDB_la_LDFLAGS	=	--no-undefined

#############################################################################3
#########################

CoinDB_sources =		\
       src/Schema.cpp		\
       src/Vault.cpp		\
       src/SynchedVault.cpp	\
       src/Schema-odb-sqlite.cxx


logger_sources = ../logger/src/logger.cpp

sysutils_sources =  ../sysutils/src/filesystem.cpp
