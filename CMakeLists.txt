cmake_minimum_required(VERSION 3.14)
project(socketclips)

## Compile as C++14
add_compile_options(-std=c++14)
find_package(Boost COMPONENTS thread REQUIRED)

set(TCP_CLIPS64_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/include")

###########
## Build ##
###########


## Build the CLIPS library libclips.a
add_subdirectory(clips64)

## Build the bridge library libclipswrapper.a
add_subdirectory(clipswrapper)

## Build the server
add_subdirectory(clipsserver)

## Build the client
add_subdirectory(clipsclient)

## Build the clipscontrol app
add_subdirectory(clipscontrol)

## Build the testing apps
add_subdirectory(tests)
