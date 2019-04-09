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
include optixRaycasting/CMakeFiles/optixRaycasting.dir/depend.make

# Include the progress variables for this target.
include optixRaycasting/CMakeFiles/optixRaycasting.dir/progress.make

# Include the compile flags for this target's objects.
include optixRaycasting/CMakeFiles/optixRaycasting.dir/flags.make

lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/alloca.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/assert.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/concept_check.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/cpp_type_traits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/cxxabi_init_exception.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/exception.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/exception_defines.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/exception_ptr.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/hash_bytes.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/move.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/nested_exception.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/bits/std_abs.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/cmath
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/cstdio
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/cstdlib
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/exception
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/ext/type_traits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/math.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/new
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/stdlib.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/type_traits
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/c++/7/typeinfo
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/endian.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/features.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/limits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/linux/limits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/math.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/stdc-predef.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/stdio.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/stdlib.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/string.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/strings.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/time.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/_G_config.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/byteswap-16.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/byteswap.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/endian.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/floatn-common.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/floatn.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/flt-eval-method.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/fp-fast.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/fp-logb.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/iscanonical.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/libc-header-start.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/libio.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/local_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/long-double.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/math-vector.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/mathcalls.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/posix1_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/posix2_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/select.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/stdint-intn.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/stdio_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/stdlib-float.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/sys_errlist.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/sysmacros.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/time.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/timex.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/FILE.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/__FILE.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/clock_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/clockid_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/locale_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/sigset_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/time_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/types/timer_t.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/typesizes.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/uintn-identity.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/uio_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/waitflags.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/waitstatus.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/wordsize.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/bits/xopen_lim.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/c++/7/bits/c++config.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/c++/7/bits/cpu_defines.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/c++/7/bits/os_defines.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/gnu/stubs-64.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/gnu/stubs.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/sys/cdefs.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/sys/select.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/sys/sysmacros.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/include/x86_64-linux-gnu/sys/types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/syslimits.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/Common.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycastingKernels.cu
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycastingKernels.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/internal/optix_datatypes.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/internal/optix_declarations.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/internal/optix_defines.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/internal/optix_internal.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optix.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optix_device.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optix_sizet.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optixu/optixu_math_namespace.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optixu/optixu_vector_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/include/optixu/optixu_vector_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/builtin_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/channel_descriptor.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/common_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/device_double_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/device_double_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/device_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/device_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/host_config.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/host_defines.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/math_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/math_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/sm_70_rt.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/crt/sm_70_rt.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/cuda_device_runtime_api.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/cuda_runtime.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/cuda_runtime_api.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/cuda_surface_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/cuda_texture_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/device_atomic_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/device_atomic_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/device_launch_parameters.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/device_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/driver_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/driver_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/library_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_20_atomic_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_20_atomic_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_20_intrinsics.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_20_intrinsics.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_30_intrinsics.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_30_intrinsics.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_32_atomic_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_32_atomic_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_32_intrinsics.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_32_intrinsics.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_35_atomic_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_35_intrinsics.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_60_atomic_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_60_atomic_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_61_intrinsics.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/sm_61_intrinsics.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/surface_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/surface_indirect_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/surface_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/texture_fetch_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/texture_indirect_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/texture_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/vector_functions.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/vector_functions.hpp
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/cuda/include/vector_types.h
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting_generated_optixRaycastingKernels.cu.o.cmake
lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycastingKernels.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o"
	cd /home/jason/CUDA/Optix/optixRaycasting/CMakeFiles/optixRaycasting.dir && /usr/bin/cmake -E make_directory /home/jason/CUDA/Optix/lib/ptx/.
	cd /home/jason/CUDA/Optix/optixRaycasting/CMakeFiles/optixRaycasting.dir && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D check_dependencies:BOOL=OFF -D build_configuration:STRING=Release -D generated_file:STRING=/home/jason/CUDA/Optix/lib/ptx/./optixRaycasting_generated_optixRaycastingKernels.cu.o -D generated_cubin_file:STRING=/home/jason/CUDA/Optix/lib/ptx/./optixRaycasting_generated_optixRaycastingKernels.cu.o.cubin.txt -D generated_fatbin_file:STRING=/home/jason/CUDA/Optix/lib/ptx/./optixRaycasting_generated_optixRaycastingKernels.cu.o.fatbin.txt -P /home/jason/CUDA/Optix/optixRaycasting/CMakeFiles/optixRaycasting.dir//optixRaycasting_generated_optixRaycastingKernels.cu.o.cmake

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o: optixRaycasting/CMakeFiles/optixRaycasting.dir/flags.make
optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/OptiXRaycastingContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/OptiXRaycastingContext.cpp

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.i"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/OptiXRaycastingContext.cpp > CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.i

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.s"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/OptiXRaycastingContext.cpp -o CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.s

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.requires:

.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.requires

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.provides: optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.requires
	$(MAKE) -f optixRaycasting/CMakeFiles/optixRaycasting.dir/build.make optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.provides.build
.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.provides

optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.provides.build: optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o


optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o: optixRaycasting/CMakeFiles/optixRaycasting.dir/flags.make
optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycasting.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o -c /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycasting.cpp

optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.i"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycasting.cpp > CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.i

optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.s"
	cd /home/jason/CUDA/Optix/optixRaycasting && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting/optixRaycasting.cpp -o CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.s

optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.requires:

.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.requires

optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.provides: optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.requires
	$(MAKE) -f optixRaycasting/CMakeFiles/optixRaycasting.dir/build.make optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.provides.build
.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.provides

optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.provides.build: optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o


# Object files for target optixRaycasting
optixRaycasting_OBJECTS = \
"CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o" \
"CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o"

# External object files for target optixRaycasting
optixRaycasting_EXTERNAL_OBJECTS = \
"/home/jason/CUDA/Optix/lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o"

bin/optixRaycasting: optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o
bin/optixRaycasting: optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o
bin/optixRaycasting: lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o
bin/optixRaycasting: optixRaycasting/CMakeFiles/optixRaycasting.dir/build.make
bin/optixRaycasting: lib/libsutil_sdk.so
bin/optixRaycasting: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/lib64/liboptix.so
bin/optixRaycasting: /usr/local/cuda/lib64/libcudart_static.a
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/librt.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libdl.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libXi.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libGL.so
bin/optixRaycasting: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixRaycasting: /usr/local/cuda/lib64/libnvrtc.so
bin/optixRaycasting: optixRaycasting/CMakeFiles/optixRaycasting.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jason/CUDA/Optix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../bin/optixRaycasting"
	cd /home/jason/CUDA/Optix/optixRaycasting && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixRaycasting.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixRaycasting/CMakeFiles/optixRaycasting.dir/build: bin/optixRaycasting

.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/build

optixRaycasting/CMakeFiles/optixRaycasting.dir/requires: optixRaycasting/CMakeFiles/optixRaycasting.dir/OptiXRaycastingContext.cpp.o.requires
optixRaycasting/CMakeFiles/optixRaycasting.dir/requires: optixRaycasting/CMakeFiles/optixRaycasting.dir/optixRaycasting.cpp.o.requires

.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/requires

optixRaycasting/CMakeFiles/optixRaycasting.dir/clean:
	cd /home/jason/CUDA/Optix/optixRaycasting && $(CMAKE_COMMAND) -P CMakeFiles/optixRaycasting.dir/cmake_clean.cmake
.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/clean

optixRaycasting/CMakeFiles/optixRaycasting.dir/depend: lib/ptx/optixRaycasting_generated_optixRaycastingKernels.cu.o
	cd /home/jason/CUDA/Optix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK/optixRaycasting /home/jason/CUDA/Optix /home/jason/CUDA/Optix/optixRaycasting /home/jason/CUDA/Optix/optixRaycasting/CMakeFiles/optixRaycasting.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixRaycasting/CMakeFiles/optixRaycasting.dir/depend
