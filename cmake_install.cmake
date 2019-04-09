# Install script for directory: /usr/local/NVIDIA-OptiX-SDK-6.0.0-linux64/SDK

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jason/CUDA/Optix/optixBuffersOfBuffers/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixCallablePrograms/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixCompressedTexture/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixConsole/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixDenoiser/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixDeviceQuery/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixDynamicGeometry/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixGeometryTriangles/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixHello/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixInstancing/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixMDLDisplacement/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixMDLExpressions/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixMDLSphere/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixMeshViewer/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixMotionBlur/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixParticles/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixPathTracer/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixPrimitiveIndexOffsets/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixRaycasting/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixSelector/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixSphere/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixSpherePP/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixSSIMPredictor/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixTextureSampler/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixTutorial/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/optixWhitted/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeInstancing/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeMasking/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeMultiBuffering/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeMultiGpu/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeSimple/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/primeSimplePP/cmake_install.cmake")
  include("/home/jason/CUDA/Optix/sutil/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jason/CUDA/Optix/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
