cmake_minimum_required(VERSION 3.28.3)

# Project details
project(chip8-emulator VERSION 0.1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Build type (Default to Release if not specified)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose build type: Debug or Release" FORCE)
endif()

# Output directories for different build types
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) # Base output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/Debug)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/Release)

# Source files
set(source_dir "${PROJECT_SOURCE_DIR}/src/")
file(GLOB source_files "${source_dir}/*.cpp")

# Find SDL2
find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})

# Executable
add_executable(chip8-emulator ${source_files})

# Link SDL2
target_link_libraries(chip8-emulator ${SDL2_LIBRARIES})

# Set output directories based on build type
set_target_properties(chip8-emulator PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}
)

# Enable debug symbols for Debug build
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(chip8-emulator PRIVATE DEBUG)
    target_compile_options(chip8-emulator PRIVATE -g)
endif()
