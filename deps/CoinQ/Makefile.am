# Copyright (c) 2015-2017 secureTXS (NZ) Ltd., All Rights Reserved.
#
lib_LTLIBRARIES		=	libCoinQ.la

libCoinQ_la_CXXFLAGS	=	$(AM_CXXFLAGS) -Isrc -I../include

libCoinQ_la_SOURCES	=	$(CoinQ_sources)

libCoinQ_la_LIBADD	=	$(top_builddir)/deps/CoinCore/libCoinCore.la	\
                                $(top_builddir)/deps/logger/liblogger.la	\
                                $(top_builddir)/deps/sysutils/libsysutils.la	\
                                $(DEPS_LIBS)

#libCoinQ_la_DEPENDENCIES	= $(top_builddir)/deps/CoinCore/libCoinCore.la

libCoinQ_la_LDFLAGS	=	--no-undefined

#########################

CoinQ_sources =			\
    src/CoinQ_coinparams.cpp	\
    src/CoinQ_script.cpp	\
    src/CoinQ_peer_io.cpp	\
    src/CoinQ_netsync.cpp	\
    src/CoinQ_blocks.cpp	\
    src/CoinQ_txs.cpp		\
    src/CoinQ_keys.cpp		\
    src/CoinQ_filter.cpp	\
    src/BlockchainDownload.cpp

