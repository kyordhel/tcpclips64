cmake_minimum_required(VERSION 3.14)
project(clipsclient)

file(GLOB CLIPSCLIENT_SRC
  ${PROJECT_SOURCE_DIR}/src/*.cpp
)

## Declare static library
add_library(clipsclient STATIC
  ${CLIPSCLIENT_SRC}
)

target_include_directories(clipsclient
  PUBLIC
  ${TCP_CLIPS64_HEADERS}
  ${TCP_CLIPS64_HEADERS}/clipsclient
)

# target_link_libraries(tcpclient
#   clips60
# )

