CMAKE_MINIMUM_REQUIRED (VERSION 2.8.7)
PROJECT (pbc)

OPTION (PBC_BUILD_LUA "Build build lua" ON)

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

INCLUDE_DIRECTORIES (${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/lua_include
)

IF (APPLE)
    INCLUDE_DIRECTORIES (/usr/include/malloc)
ENDIF ()

IF (PBC_BUILD_LUA)
    LIST (APPEND pbc_SOURCES
        binding/lua/pbc-lua.c
    )
ENDIF ()

ADD_LIBRARY (pbc
    ${pbc_SOURCES}
    ${pbc_HEADERS}
)

IF (WIN32)
    SET_TARGET_PROPERTIES( pbc PROPERTIES COMPILE_FLAGS "/TP /MP" ${BUILD_FLAGS})
ENDIF ()
