cmake_minimum_required(VERSION 3.14)

project(clips)
add_definitions(-w) # disable all warnings

file(GLOB CLIPS_SRC
  ${PROJECT_SOURCE_DIR}/src/*.c
)

## Declare a C library
add_library(clips64 STATIC
  ${CLIPS_SRC}
)

target_include_directories(clips64
  PRIVATE
  ${TCP_CLIPS64_HEADERS}/clips
  PUBLIC
  ${TCP_CLIPS64_HEADERS}
)

# set_target_properties(clips64
#   PROPERTIES
#   OUTPUT_NAME "lib${PROJECT_NAME}.so"
#   PREFIX ""
#   SUFFIX ""
# )
