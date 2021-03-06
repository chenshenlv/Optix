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
include optixSpherePP/CMakeFiles/optixSpherePP.dir/depend.make

# Include the progress variables for this target.
include optixSpherePP/CMakeFiles/optixSpherePP.dir/progress.make

# Include the compile flags for this target's objects.
include optixSpherePP/CMakeFiles/optixSpherePP.dir/flags.make

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o: optixSpherePP/CMakeFiles/optixSpherePP.dir/flags.make
optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSpherePP/optixSpherePP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o"
	cd /home/jason/CUDA/Optix/optixSpherePP && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSpherePP/optixSpherePP.cpp

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.i"
	cd /home/jason/CUDA/Optix/optixSpherePP && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSpherePP/optixSpherePP.cpp > CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.i

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.s"
	cd /home/jason/CUDA/Optix/optixSpherePP && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSpherePP/optixSpherePP.cpp -o CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.s

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.requires:

.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.requires

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.provides: optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.requires
	$(MAKE) -f optixSpherePP/CMakeFiles/optixSpherePP.dir/build.make optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.provides.build
.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.provides

optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.provides.build: optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o


# Object files for target optixSpherePP
optixSpherePP_OBJECTS = \
"CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o"

# External object files for target optixSpherePP
optixSpherePP_EXTERNAL_OBJECTS =

bin/optixSpherePP: optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o
bin/optixSpherePP: optixSpherePP/CMakeFiles/optixSpherePP.dir/build.make
bin/optixSpherePP: lib/libsutil_sdk.so
bin/optixSpherePP: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixSpherePP: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixSpherePP: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixSpherePP: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixSpherePP: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixSpherePP: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixSpherePP: /usr/local/cuda/lib64/libnvrtc.so
bin/optixSpherePP: optixSpherePP/CMakeFiles/optixSpherePP.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixSpherePP"
	cd /home/jason/CUDA/Optix/optixSpherePP && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixSpherePP.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixSpherePP/CMakeFiles/optixSpherePP.dir/build: bin/optixSpherePP

.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/build

optixSpherePP/CMakeFiles/optixSpherePP.dir/requires: optixSpherePP/CMakeFiles/optixSpherePP.dir/optixSpherePP.cpp.o.requires

.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/requires

optixSpherePP/CMakeFiles/optixSpherePP.dir/clean:
	cd /home/jason/CUDA/Optix/optixSpherePP && $(CMAKE_COMMAND) -P CMakeFiles/optixSpherePP.dir/cmake_clean.cmake
.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/clean

optixSpherePP/CMakeFiles/optixSpherePP.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSpherePP /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixSpherePP /home/jason/CUDA/Optix/optixSpherePP/CMakeFiles/optixSpherePP.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixSpherePP/CMakeFiles/optixSpherePP.dir/depend

