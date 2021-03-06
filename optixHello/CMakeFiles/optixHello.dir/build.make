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
include optixHello/CMakeFiles/optixHello.dir/depend.make

# Include the progress variables for this target.
include optixHello/CMakeFiles/optixHello.dir/progress.make

# Include the compile flags for this target's objects.
include optixHello/CMakeFiles/optixHello.dir/flags.make

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o: optixHello/CMakeFiles/optixHello.dir/flags.make
optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixHello/optixHello.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o"
	cd /home/jason/CUDA/Optix/optixHello && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixHello.dir/optixHello.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixHello/optixHello.cpp

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixHello.dir/optixHello.cpp.i"
	cd /home/jason/CUDA/Optix/optixHello && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixHello/optixHello.cpp > CMakeFiles/optixHello.dir/optixHello.cpp.i

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixHello.dir/optixHello.cpp.s"
	cd /home/jason/CUDA/Optix/optixHello && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixHello/optixHello.cpp -o CMakeFiles/optixHello.dir/optixHello.cpp.s

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.requires:

.PHONY : optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.requires

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.provides: optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.requires
	$(MAKE) -f optixHello/CMakeFiles/optixHello.dir/build.make optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.provides.build
.PHONY : optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.provides

optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.provides.build: optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o


# Object files for target optixHello
optixHello_OBJECTS = \
"CMakeFiles/optixHello.dir/optixHello.cpp.o"

# External object files for target optixHello
optixHello_EXTERNAL_OBJECTS =

bin/optixHello: optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o
bin/optixHello: optixHello/CMakeFiles/optixHello.dir/build.make
bin/optixHello: lib/libsutil_sdk.so
bin/optixHello: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixHello: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixHello: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixHello: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixHello: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixHello: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixHello: /usr/local/cuda/lib64/libnvrtc.so
bin/optixHello: optixHello/CMakeFiles/optixHello.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixHello"
	cd /home/jason/CUDA/Optix/optixHello && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixHello.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixHello/CMakeFiles/optixHello.dir/build: bin/optixHello

.PHONY : optixHello/CMakeFiles/optixHello.dir/build

optixHello/CMakeFiles/optixHello.dir/requires: optixHello/CMakeFiles/optixHello.dir/optixHello.cpp.o.requires

.PHONY : optixHello/CMakeFiles/optixHello.dir/requires

optixHello/CMakeFiles/optixHello.dir/clean:
	cd /home/jason/CUDA/Optix/optixHello && $(CMAKE_COMMAND) -P CMakeFiles/optixHello.dir/cmake_clean.cmake
.PHONY : optixHello/CMakeFiles/optixHello.dir/clean

optixHello/CMakeFiles/optixHello.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixHello /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixHello /home/jason/CUDA/Optix/optixHello/CMakeFiles/optixHello.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixHello/CMakeFiles/optixHello.dir/depend

