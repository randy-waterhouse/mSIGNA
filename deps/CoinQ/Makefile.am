lib_LTLIBRARIES		=	libCoinQ.la

libCoinQ_la_CXXFLAGS	=	$(AM_CXXFLAGS) -I../include

libCoinQ_la_SOURCES	=	$(CoinQ_sources) $(CoinQ_headers)		\
				$(scrypt_sources) $(hashfunc_sources)

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


CoinQ_headers =		\
        src/encodings.h		\
        src/hash.h		\
        src/hashblock.h		\
        src/jsonResult.h	\
        src/numericdata.h	\
        src/random.h		\
        src/typedefs.h		\
        src/uint256.h		\
        src/Base58Check.h	\
        src/BigInt.h

scrypt_sources =		\
        src/scrypt/scrypt.cpp

hashfunc_sources = \
        src/hashfunc/blake.c \
        src/hashfunc/bmw.c \
        src/hashfunc/groestl.c \
        src/hashfunc/jh.c \
        src/hashfunc/keccak.c \
        src/hashfunc/skein.c

