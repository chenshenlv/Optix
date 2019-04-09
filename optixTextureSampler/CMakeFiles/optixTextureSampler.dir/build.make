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
include optixTextureSampler/CMakeFiles/optixTextureSampler.dir/depend.make

# Include the progress variables for this target.
include optixTextureSampler/CMakeFiles/optixTextureSampler.dir/progress.make

# Include the compile flags for this target's objects.
include optixTextureSampler/CMakeFiles/optixTextureSampler.dir/flags.make

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/flags.make
optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixTextureSampler/optixTextureSampler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o"
	cd /home/jason/CUDA/Optix/optixTextureSampler && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixTextureSampler/optixTextureSampler.cpp

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.i"
	cd /home/jason/CUDA/Optix/optixTextureSampler && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixTextureSampler/optixTextureSampler.cpp > CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.i

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.s"
	cd /home/jason/CUDA/Optix/optixTextureSampler && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixTextureSampler/optixTextureSampler.cpp -o CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.s

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.requires:

.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.requires

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.provides: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.requires
	$(MAKE) -f optixTextureSampler/CMakeFiles/optixTextureSampler.dir/build.make optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.provides.build
.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.provides

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.provides.build: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o


# Object files for target optixTextureSampler
optixTextureSampler_OBJECTS = \
"CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o"

# External object files for target optixTextureSampler
optixTextureSampler_EXTERNAL_OBJECTS =

bin/optixTextureSampler: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o
bin/optixTextureSampler: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/build.make
bin/optixTextureSampler: lib/libsutil_sdk.so
bin/optixTextureSampler: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixTextureSampler: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixTextureSampler: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixTextureSampler: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixTextureSampler: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixTextureSampler: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixTextureSampler: /usr/local/cuda/lib64/libnvrtc.so
bin/optixTextureSampler: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixTextureSampler"
	cd /home/jason/CUDA/Optix/optixTextureSampler && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixTextureSampler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixTextureSampler/CMakeFiles/optixTextureSampler.dir/build: bin/optixTextureSampler

.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/build

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/requires: optixTextureSampler/CMakeFiles/optixTextureSampler.dir/optixTextureSampler.cpp.o.requires

.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/requires

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/clean:
	cd /home/jason/CUDA/Optix/optixTextureSampler && $(CMAKE_COMMAND) -P CMakeFiles/optixTextureSampler.dir/cmake_clean.cmake
.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/clean

optixTextureSampler/CMakeFiles/optixTextureSampler.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixTextureSampler /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixTextureSampler /home/jason/CUDA/Optix/optixTextureSampler/CMakeFiles/optixTextureSampler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixTextureSampler/CMakeFiles/optixTextureSampler.dir/depend

