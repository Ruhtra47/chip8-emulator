# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arthur/Dev/chip8-emulator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arthur/Dev/chip8-emulator/build

# Include any dependencies generated for this target.
include CMakeFiles/chip8-emulator.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/chip8-emulator.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/chip8-emulator.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/chip8-emulator.dir/flags.make

CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o: CMakeFiles/chip8-emulator.dir/flags.make
CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o: /home/arthur/Dev/chip8-emulator/src/chip8.cpp
CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o: CMakeFiles/chip8-emulator.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arthur/Dev/chip8-emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o -MF CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o.d -o CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o -c /home/arthur/Dev/chip8-emulator/src/chip8.cpp

CMakeFiles/chip8-emulator.dir/src/chip8.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/chip8-emulator.dir/src/chip8.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arthur/Dev/chip8-emulator/src/chip8.cpp > CMakeFiles/chip8-emulator.dir/src/chip8.cpp.i

CMakeFiles/chip8-emulator.dir/src/chip8.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/chip8-emulator.dir/src/chip8.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arthur/Dev/chip8-emulator/src/chip8.cpp -o CMakeFiles/chip8-emulator.dir/src/chip8.cpp.s

CMakeFiles/chip8-emulator.dir/src/main.cpp.o: CMakeFiles/chip8-emulator.dir/flags.make
CMakeFiles/chip8-emulator.dir/src/main.cpp.o: /home/arthur/Dev/chip8-emulator/src/main.cpp
CMakeFiles/chip8-emulator.dir/src/main.cpp.o: CMakeFiles/chip8-emulator.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arthur/Dev/chip8-emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/chip8-emulator.dir/src/main.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/chip8-emulator.dir/src/main.cpp.o -MF CMakeFiles/chip8-emulator.dir/src/main.cpp.o.d -o CMakeFiles/chip8-emulator.dir/src/main.cpp.o -c /home/arthur/Dev/chip8-emulator/src/main.cpp

CMakeFiles/chip8-emulator.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/chip8-emulator.dir/src/main.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arthur/Dev/chip8-emulator/src/main.cpp > CMakeFiles/chip8-emulator.dir/src/main.cpp.i

CMakeFiles/chip8-emulator.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/chip8-emulator.dir/src/main.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arthur/Dev/chip8-emulator/src/main.cpp -o CMakeFiles/chip8-emulator.dir/src/main.cpp.s

# Object files for target chip8-emulator
chip8__emulator_OBJECTS = \
"CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o" \
"CMakeFiles/chip8-emulator.dir/src/main.cpp.o"

# External object files for target chip8-emulator
chip8__emulator_EXTERNAL_OBJECTS =

chip8-emulator: CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o
chip8-emulator: CMakeFiles/chip8-emulator.dir/src/main.cpp.o
chip8-emulator: CMakeFiles/chip8-emulator.dir/build.make
chip8-emulator: /usr/lib/x86_64-linux-gnu/libSDL2.so
chip8-emulator: CMakeFiles/chip8-emulator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/arthur/Dev/chip8-emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable chip8-emulator"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/chip8-emulator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/chip8-emulator.dir/build: chip8-emulator
.PHONY : CMakeFiles/chip8-emulator.dir/build

CMakeFiles/chip8-emulator.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/chip8-emulator.dir/cmake_clean.cmake
.PHONY : CMakeFiles/chip8-emulator.dir/clean

CMakeFiles/chip8-emulator.dir/depend:
	cd /home/arthur/Dev/chip8-emulator/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arthur/Dev/chip8-emulator /home/arthur/Dev/chip8-emulator /home/arthur/Dev/chip8-emulator/build /home/arthur/Dev/chip8-emulator/build /home/arthur/Dev/chip8-emulator/build/CMakeFiles/chip8-emulator.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/chip8-emulator.dir/depend

