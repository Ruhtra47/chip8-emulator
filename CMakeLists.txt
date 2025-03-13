cmake_minimum_required(VERSION 3.28.3)

project(chip8-emulator VERSION 0.1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(source_dir "${PROJECT_SOURCE_DIR}/src/")

file(GLOB source_files "${source_dir}/*.cpp")

find_package(SDL2 REQUIRED)
include_directories(
    # chip8-emulator
    ${SDL2_INCLUDE_DIRS})

add_executable(chip8-emulator ${source_files})
target_link_libraries(chip8-emulator ${SDL2_LIBRARIES})