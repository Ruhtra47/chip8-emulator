# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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
CMAKE_BINARY_DIR = /home/arthur/Dev/chip8-emulator

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/arthur/Dev/chip8-emulator/CMakeFiles /home/arthur/Dev/chip8-emulator//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/arthur/Dev/chip8-emulator/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named chip8-emulator

# Build rule for target.
chip8-emulator: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 chip8-emulator
.PHONY : chip8-emulator

# fast build rule for target.
chip8-emulator/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/build
.PHONY : chip8-emulator/fast

src/chip8.o: src/chip8.cpp.o
.PHONY : src/chip8.o

# target to build an object file
src/chip8.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/chip8.cpp.o
.PHONY : src/chip8.cpp.o

src/chip8.i: src/chip8.cpp.i
.PHONY : src/chip8.i

# target to preprocess a source file
src/chip8.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/chip8.cpp.i
.PHONY : src/chip8.cpp.i

src/chip8.s: src/chip8.cpp.s
.PHONY : src/chip8.s

# target to generate assembly for a file
src/chip8.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/chip8.cpp.s
.PHONY : src/chip8.cpp.s

src/main.o: src/main.cpp.o
.PHONY : src/main.o

# target to build an object file
src/main.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/main.cpp.o
.PHONY : src/main.cpp.o

src/main.i: src/main.cpp.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/main.cpp.i
.PHONY : src/main.cpp.i

src/main.s: src/main.cpp.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/main.cpp.s
.PHONY : src/main.cpp.s

src/window.o: src/window.cpp.o
.PHONY : src/window.o

# target to build an object file
src/window.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/window.cpp.o
.PHONY : src/window.cpp.o

src/window.i: src/window.cpp.i
.PHONY : src/window.i

# target to preprocess a source file
src/window.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/window.cpp.i
.PHONY : src/window.cpp.i

src/window.s: src/window.cpp.s
.PHONY : src/window.s

# target to generate assembly for a file
src/window.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/chip8-emulator.dir/build.make CMakeFiles/chip8-emulator.dir/src/window.cpp.s
.PHONY : src/window.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... chip8-emulator"
	@echo "... src/chip8.o"
	@echo "... src/chip8.i"
	@echo "... src/chip8.s"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
	@echo "... src/window.o"
	@echo "... src/window.i"
	@echo "... src/window.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

