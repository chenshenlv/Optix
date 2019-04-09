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
include optixSelector/CMakeFiles/optixSelector.dir/depend.make

# Include the progress variables for this target.
include optixSelector/CMakeFiles/optixSelector.dir/progress.make

# Include the compile flags for this target's objects.
include optixSelector/CMakeFiles/optixSelector.dir/flags.make

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o: optixSelector/CMakeFiles/optixSelector.dir/flags.make
optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSelector/optixSelector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o"
	cd /home/jason/CUDA/Optix/optixSelector && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixSelector.dir/optixSelector.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSelector/optixSelector.cpp

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixSelector.dir/optixSelector.cpp.i"
	cd /home/jason/CUDA/Optix/optixSelector && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSelector/optixSelector.cpp > CMakeFiles/optixSelector.dir/optixSelector.cpp.i

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixSelector.dir/optixSelector.cpp.s"
	cd /home/jason/CUDA/Optix/optixSelector && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSelector/optixSelector.cpp -o CMakeFiles/optixSelector.dir/optixSelector.cpp.s

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.requires:

.PHONY : optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.requires

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.provides: optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.requires
	$(MAKE) -f optixSelector/CMakeFiles/optixSelector.dir/build.make optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.provides.build
.PHONY : optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.provides

optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.provides.build: optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o


# Object files for target optixSelector
optixSelector_OBJECTS = \
"CMakeFiles/optixSelector.dir/optixSelector.cpp.o"

# External object files for target optixSelector
optixSelector_EXTERNAL_OBJECTS =

bin/optixSelector: optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o
bin/optixSelector: optixSelector/CMakeFiles/optixSelector.dir/build.make
bin/optixSelector: lib/libsutil_sdk.so
bin/optixSelector: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixSelector: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixSelector: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixSelector: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixSelector: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixSelector: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixSelector: /usr/local/cuda/lib64/libnvrtc.so
bin/optixSelector: optixSelector/CMakeFiles/optixSelector.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixSelector"
	cd /home/jason/CUDA/Optix/optixSelector && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixSelector.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixSelector/CMakeFiles/optixSelector.dir/build: bin/optixSelector

.PHONY : optixSelector/CMakeFiles/optixSelector.dir/build

optixSelector/CMakeFiles/optixSelector.dir/requires: optixSelector/CMakeFiles/optixSelector.dir/optixSelector.cpp.o.requires

.PHONY : optixSelector/CMakeFiles/optixSelector.dir/requires

optixSelector/CMakeFiles/optixSelector.dir/clean:
	cd /home/jason/CUDA/Optix/optixSelector && $(CMAKE_COMMAND) -P CMakeFiles/optixSelector.dir/cmake_clean.cmake
.PHONY : optixSelector/CMakeFiles/optixSelector.dir/clean

optixSelector/CMakeFiles/optixSelector.dir/depend:
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixSelector /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixSelector /home/jason/CUDA/Optix/optixSelector/CMakeFiles/optixSelector.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixSelector/CMakeFiles/optixSelector.dir/depend
