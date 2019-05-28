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
include optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/depend.make

# Include the progress variables for this target.
include optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/progress.make

# Include the compile flags for this target's objects.
include optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/flags.make

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/flags.make
optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixMDLExpressions/optixMDLExpressions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o"
	cd /home/jason/CUDA/Optix/optixMDLExpressions && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixMDLExpressions/optixMDLExpressions.cpp

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.i"
	cd /home/jason/CUDA/Optix/optixMDLExpressions && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixMDLExpressions/optixMDLExpressions.cpp > CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.i

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.s"
	cd /home/jason/CUDA/Optix/optixMDLExpressions && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixMDLExpressions/optixMDLExpressions.cpp -o CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.s

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.requires:

.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.requires

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.provides: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.requires
	$(MAKE) -f optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/build.make optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.provides.build
.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.provides

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.provides.build: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o


# Object files for target optixMDLExpressions
optixMDLExpressions_OBJECTS = \
"CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o"

# External object files for target optixMDLExpressions
optixMDLExpressions_EXTERNAL_OBJECTS =

bin/optixMDLExpressions: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o
bin/optixMDLExpressions: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/build.make
bin/optixMDLExpressions: lib/libsutil_sdk.so
bin/optixMDLExpressions: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixMDLExpressions: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/support/mdl_wrapper/lib/libmdl_wrapper.so
bin/optixMDLExpressions: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixMDLExpressions: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixMDLExpressions: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixMDLExpressions: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixMDLExpressions: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixMDLExpressions: /usr/local/cuda/lib64/libnvrtc.so
bin/optixMDLExpressions: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixMDLExpressions"
	cd /home/jason/CUDA/Optix/optixMDLExpressions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixMDLExpressions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/build: bin/optixMDLExpressions

.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/build

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/requires: optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/optixMDLExpressions.cpp.o.requires

.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/requires

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/clean:
	cd /home/jason/CUDA/Optix/optixMDLExpressions && $(CMAKE_COMMAND) -P CMakeFiles/optixMDLExpressions.dir/cmake_clean.cmake
.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/clean

optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixMDLExpressions /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixMDLExpressions /home/jason/CUDA/Optix/optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixMDLExpressions/CMakeFiles/optixMDLExpressions.dir/depend

