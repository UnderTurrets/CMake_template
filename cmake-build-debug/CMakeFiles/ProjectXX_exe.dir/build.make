# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xu736946693/Desktop/CMake-template

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xu736946693/Desktop/CMake-template/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ProjectXX_exe.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ProjectXX_exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ProjectXX_exe.dir/flags.make

CMakeFiles/ProjectXX_exe.dir/main.cpp.o: CMakeFiles/ProjectXX_exe.dir/flags.make
CMakeFiles/ProjectXX_exe.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xu736946693/Desktop/CMake-template/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ProjectXX_exe.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ProjectXX_exe.dir/main.cpp.o -c /home/xu736946693/Desktop/CMake-template/main.cpp

CMakeFiles/ProjectXX_exe.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ProjectXX_exe.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xu736946693/Desktop/CMake-template/main.cpp > CMakeFiles/ProjectXX_exe.dir/main.cpp.i

CMakeFiles/ProjectXX_exe.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ProjectXX_exe.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xu736946693/Desktop/CMake-template/main.cpp -o CMakeFiles/ProjectXX_exe.dir/main.cpp.s

# Object files for target ProjectXX_exe
ProjectXX_exe_OBJECTS = \
"CMakeFiles/ProjectXX_exe.dir/main.cpp.o"

# External object files for target ProjectXX_exe
ProjectXX_exe_EXTERNAL_OBJECTS =

ProjectXX_exe: CMakeFiles/ProjectXX_exe.dir/main.cpp.o
ProjectXX_exe: CMakeFiles/ProjectXX_exe.dir/build.make
ProjectXX_exe: libProjectXX.a
ProjectXX_exe: CMakeFiles/ProjectXX_exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xu736946693/Desktop/CMake-template/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ProjectXX_exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ProjectXX_exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ProjectXX_exe.dir/build: ProjectXX_exe

.PHONY : CMakeFiles/ProjectXX_exe.dir/build

CMakeFiles/ProjectXX_exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ProjectXX_exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ProjectXX_exe.dir/clean

CMakeFiles/ProjectXX_exe.dir/depend:
	cd /home/xu736946693/Desktop/CMake-template/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xu736946693/Desktop/CMake-template /home/xu736946693/Desktop/CMake-template /home/xu736946693/Desktop/CMake-template/cmake-build-debug /home/xu736946693/Desktop/CMake-template/cmake-build-debug /home/xu736946693/Desktop/CMake-template/cmake-build-debug/CMakeFiles/ProjectXX_exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ProjectXX_exe.dir/depend
