# Copyright (c) 2015-2017 secureTXS (NZ) Ltd., All Rights Reserved.
#
lib_LTLIBRARIES		=	libCoinDB.la

libCoinDB_la_CXXFLAGS	=	$(AM_CXXFLAGS) -Isrc -I../include "-DDATABASE_SQLITE"

libCoinDB_la_SOURCES	=	$(CoinDB_sources)

libCoinDB_la_LIBADD	=	$(top_builddir)/deps/CoinCore/libCoinCore.la	\
                                $(top_builddir)/deps/CoinQ/libCoinQ.la		\
                                $(top_builddir)/deps/logger/liblogger.la	\
                                $(top_builddir)/deps/sysutils/libsysutils.la	\
                                $(DB_LIBS) $(DEPS_LIBS)

#libCoinDB_la_DEPENDENCIES	= $(top_builddir)/deps/CoinCore/libCoinCore.la

libCoinDB_la_LDFLAGS	=	--no-undefined

#########################

CoinDB_sources =		\
       src/Schema.cpp		\
       src/Vault.cpp		\
       src/SynchedVault.cpp	\
       src/Schema-odb-sqlite.cxx

# Special rules for odb to generate compiled dependencies
#
odb/Schema-odb-$(DB).hxx: src/Schema.h
	$(ODB) --output-dir odb/ --std c++11 $(ODB_DB) --database $(DB) --odb-file-suffix -odb-$(DB) --changelog-file-suffix -$(DB) --generate-query --generate-schema --schema-format embedded $(ODB_INCLUDE_PATH) $<

odb/Schema-odb-$(DB).cxx: odb/Schema-odb-$(DB).hxx

