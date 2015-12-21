# Copyright (c) 2015-2017 secureTXS (NZ) Ltd., All Rights Reserved.
#
lib_LTLIBRARIES		=	libCoinCore.la

libCoinCore_la_SOURCES	=	$(CoinCore_sources) $(scrypt_sources) $(hashfunc_sources)

libCoinCore_la_CXXFLAGS	=	$(AM_CXXFLAGS) -I../include

libCoinCore_la_LDFLAGS	=	--no-undefined

#########################

CoinCore_sources =		\
        src/aes.cpp		\
        src/bip39.cpp		\
        src/hdkeys.cpp		\
        src/secp256k1_openssl.cpp	\
        src/BloomFilter.cpp	\
        src/CoinKey.cpp		\
        src/CoinNodeData.cpp	\
        src/IPv6.cpp		\
        src/MerkleTree.cpp	\
        src/StandardTransactions.cpp

scrypt_sources = \
        src/scrypt/scrypt.cpp

hashfunc_sources = \
        src/hashfunc/blake.c	\
        src/hashfunc/bmw.c	\
        src/hashfunc/groestl.c	\
        src/hashfunc/jh.c	\
        src/hashfunc/keccak.c	\
        src/hashfunc/skein.c

