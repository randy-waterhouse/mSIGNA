lib_LTLIBRARIES		=	libCoinQ.la

libCoinQ_la_CXXFLAGS	=	$(AM_CXXFLAGS) -Isrc -I../include

libCoinQ_la_SOURCES	=	$(CoinQ_sources) $(logger_sources) $(sysutils_sources)

libCoinQ_la_LIBADD	=	$(top_builddir)/deps/CoinCore/libCoinCore.la	\
                                $(DEPS_LIBS) -lcrypto

#libCoinQ_la_DEPENDENCIES	= $(top_builddir)/deps/CoinCore/libCoinCore.la

#libCoinQ_la_LDFLAGS	=	--no-undefined

#############################################################################3
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

logger_sources = ../logger/src/logger.cpp

sysutils_sources =  ../sysutils/src/filesystem.cpp

