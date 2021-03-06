# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jason/CUDA/Optix

# Include any dependencies generated for this target.
include optixWhitted/CMakeFiles/optixWhitted.dir/depend.make

# Include the progress variables for this target.
include optixWhitted/CMakeFiles/optixWhitted.dir/progress.make

# Include the compile flags for this target's objects.
include optixWhitted/CMakeFiles/optixWhitted.dir/flags.make

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o: optixWhitted/CMakeFiles/optixWhitted.dir/flags.make
optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixWhitted/optixWhitted.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o"
	cd /home/jason/CUDA/Optix/optixWhitted && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixWhitted/optixWhitted.cpp

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixWhitted.dir/optixWhitted.cpp.i"
	cd /home/jason/CUDA/Optix/optixWhitted && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixWhitted/optixWhitted.cpp > CMakeFiles/optixWhitted.dir/optixWhitted.cpp.i

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixWhitted.dir/optixWhitted.cpp.s"
	cd /home/jason/CUDA/Optix/optixWhitted && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixWhitted/optixWhitted.cpp -o CMakeFiles/optixWhitted.dir/optixWhitted.cpp.s

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.requires:

.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.requires

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.provides: optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.requires
	$(MAKE) -f optixWhitted/CMakeFiles/optixWhitted.dir/build.make optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.provides.build
.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.provides

optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.provides.build: optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o


# Object files for target optixWhitted
optixWhitted_OBJECTS = \
"CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o"

# External object files for target optixWhitted
optixWhitted_EXTERNAL_OBJECTS =

bin/optixWhitted: optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o
bin/optixWhitted: optixWhitted/CMakeFiles/optixWhitted.dir/build.make
bin/optixWhitted: lib/libsutil_sdk.so
bin/optixWhitted: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixWhitted: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixWhitted: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixWhitted: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixWhitted: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixWhitted: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixWhitted: /usr/local/cuda/lib64/libnvrtc.so
bin/optixWhitted: optixWhitted/CMakeFiles/optixWhitted.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixWhitted"
	cd /home/jason/CUDA/Optix/optixWhitted && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixWhitted.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixWhitted/CMakeFiles/optixWhitted.dir/build: bin/optixWhitted

.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/build

optixWhitted/CMakeFiles/optixWhitted.dir/requires: optixWhitted/CMakeFiles/optixWhitted.dir/optixWhitted.cpp.o.requires

.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/requires

optixWhitted/CMakeFiles/optixWhitted.dir/clean:
	cd /home/jason/CUDA/Optix/optixWhitted && $(CMAKE_COMMAND) -P CMakeFiles/optixWhitted.dir/cmake_clean.cmake
.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/clean

optixWhitted/CMakeFiles/optixWhitted.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixWhitted /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixWhitted /home/jason/CUDA/Optix/optixWhitted/CMakeFiles/optixWhitted.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixWhitted/CMakeFiles/optixWhitted.dir/depend

