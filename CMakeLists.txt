CMAKE_MINIMUM_REQUIRED (VERSION 2.8.7)
PROJECT (pbc)

SET (pbc_SOURCES
    src/alloc.c
    src/array.c
    src/bootstrap.c
    src/context.c
    src/decode.c
    src/map.c
    src/pattern.c
    src/proto.c
    src/register.c
    src/rmessage.c
    src/stringpool.c
    src/varint.c
    src/wmessage.c
)

SET (pbc_HEADERS
    src/alloc.h
    src/array.h
    src/bootstrap.h
    src/context.h
    src/descriptor.pbc.h
    src/map.h
    src/pattern.h
    src/proto.h
    src/stringpool.h
    src/varint.h
)

INCLUDE_DIRECTORIES (${CMAKE_CURRENT_SOURCE_DIR})

ADD_LIBRARY (pbc
    ${cryptopp_SOURCES}
    ${cryptopp_HEADERS}
)
