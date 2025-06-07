if (NOT TCP_CLIPS64_PATH)
    set(TCP_CLIPS64_PATH ${CMAKE_CURRENT_LIST_DIR})
endif ()

set(TCP_CLIPS64_PATH ${CMAKE_CURRENT_LIST_DIR} CACHE PATH "Path to the tcpCLIPS64 API" FORCE)
# list(APPEND CMAKE_MODULE_PATH ${TCP_CLIPS64_PATH})
message("TCP_CLIPS64_PATH is ${CMAKE_CURRENT_LIST_DIR}")
if(DEFINED TCP_CLIPS64_BIN_PATH)
    message("TCP_CLIPS64_BIN_PATH is ${TCP_CLIPS64_BIN_PATH}")
    set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${TCP_CLIPS64_BIN_PATH})
endif()
set(TCP_CLIPS64_SKIP_TEST_APPS TRUE)
add_subdirectory(${TCP_CLIPS64_PATH} tcpCLIPS64)
unset (CMAKE_RUNTIME_OUTPUT_DIRECTORY)

# ## ##################################################################
# The followint template allows you to remotely import tcpCLIPS64
# into your own project using CMake.
# Just save the code between >>><<< as tcpCLIPS64.cmake and include()
# the file in your top-most CMakeLists.txt file as follows:
#
# include(tcpCLIPS64.cmake)
#
# You can also specify where to place the generated executables by
# setting the TCP_CLIPS64_BIN_PATH variable.
# set(TCP_CLIPS64_BIN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/yourbinpath)
# ## ##################################################################
# BEGIN tcpCLIPS64_import.cmake >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# # This file can be placed into an external project to help locate tcpCLIPS64
# It should be include()ed prior to project()

# if (DEFINED ENV{TCP_CLIPS64_PATH} AND (NOT TCP_CLIPS64_PATH))
#     set(TCP_CLIPS64_PATH $ENV{TCP_CLIPS64_PATH})
#     message("Using TCP_CLIPS64_PATH from environment ('${TCP_CLIPS64_PATH}')")
# endif ()

# if (DEFINED ENV{TCP_CLIPS64_FETCH_FROM_GIT} AND (NOT TCP_CLIPS64_FETCH_FROM_GIT))
#     set(TCP_CLIPS64_FETCH_FROM_GIT $ENV{TCP_CLIPS64_FETCH_FROM_GIT})
#     message("Using TCP_CLIPS64_FETCH_FROM_GIT from environment ('${TCP_CLIPS64_FETCH_FROM_GIT}')")
# endif ()

# if (DEFINED ENV{TCP_CLIPS64_FETCH_FROM_GIT_PATH} AND (NOT TCP_CLIPS64_FETCH_FROM_GIT_PATH))
#     set(TCP_CLIPS64_FETCH_FROM_GIT_PATH $ENV{TCP_CLIPS64_FETCH_FROM_GIT_PATH})
#     message("Using TCP_CLIPS64_FETCH_FROM_GIT_PATH from environment ('${TCP_CLIPS64_FETCH_FROM_GIT_PATH}')")
# endif ()

# set(TCP_CLIPS64_PATH "${TCP_CLIPS64_PATH}" CACHE PATH "Path to the tcpCLIPS64 API")
# set(TCP_CLIPS64_FETCH_FROM_GIT "${TCP_CLIPS64_FETCH_FROM_GIT}" CACHE BOOL "Set to ON to download the tcpCLIPS64 API from git if unlocatable")
# set(TCP_CLIPS64_FETCH_FROM_GIT_PATH "${TCP_CLIPS64_FETCH_FROM_GIT_PATH}" CACHE FILEPATH "location to download tcpCLIPS64 API")

# if (NOT TCP_CLIPS64_PATH)
#     if (TCP_CLIPS64_FETCH_FROM_GIT)
#         include(FetchContent)
#         set(FETCHCONTENT_BASE_DIR_SAVE ${FETCHCONTENT_BASE_DIR})
#         if (TCP_CLIPS64_FETCH_FROM_GIT_PATH)
#             get_filename_component(FETCHCONTENT_BASE_DIR "${TCP_CLIPS64_FETCH_FROM_GIT_PATH}" REALPATH BASE_DIR "${CMAKE_SOURCE_DIR}")
#         endif ()

#         FetchContent_Declare(
#             tcpCLIPS64
#             GIT_REPOSITORY https://github.com/kyordhel/tcpclips64
#             GIT_TAG master
#         )

#         if (NOT tcpCLIPS64)
#             message("Downloading the tcpCLIPS64 API")
#             FetchContent_Populate(tcpCLIPS64)
#             set(TCP_CLIPS64_PATH ${tcpclips64_SOURCE_DIR})
#         endif ()
#         set(FETCHCONTENT_BASE_DIR ${FETCHCONTENT_BASE_DIR_SAVE})
#     else ()
#         message(FATAL_ERROR
#                 "API location was not specified. Please set TCP_CLIPS64_PATH or set TCP_CLIPS64_FETCH_FROM_GIT to on to fetch from git."
#                 )
#     endif ()
# endif ()

# get_filename_component(TCP_CLIPS64_PATH "${TCP_CLIPS64_PATH}" REALPATH BASE_DIR "${CMAKE_BINARY_DIR}")
# if (NOT EXISTS ${TCP_CLIPS64_PATH})
#     message(FATAL_ERROR "Directory '${TCP_CLIPS64_PATH}' not found")
# endif ()

# message("TCP_CLIPS64_PATH: ${TCP_CLIPS64_PATH}")

# set(TCP_CLIPS64_IMPORT_CMAKE_FILE ${TCP_CLIPS64_PATH}/tcpCLIPS64_import.cmake)
# if (NOT EXISTS ${TCP_CLIPS64_IMPORT_CMAKE_FILE})
#     message(FATAL_ERROR "Directory '${TCP_CLIPS64_PATH}' does not appear to contain the tcpCLIPS64 API")
# endif ()

# set(TCP_CLIPS64_PATH ${TCP_CLIPS64_PATH} CACHE PATH "Path to the tcpCLIPS64 API" FORCE)

# include(${TCP_CLIPS64_IMPORT_CMAKE_FILE})

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< END tcpCLIPS64_import.cmake