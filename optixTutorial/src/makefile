CUDA_PATH = /usr/local/cuda-10.1
CUDA_LIBRATY_PATH = $(CUDA_PATH)/lib64
DIR_OPTIX = /home/jason/CUDA/NVIDIA-OptiX-SDK-6.0.0-linux64
LD_LIBRARY_PATH = $(DIR_OPTIX)/lib64

NVCC = nvcc
OBJECT = optixTutorial
tutorial_num = 6
PTX = -ptx -m64
NVCCFLAGS = -I $(DIR_OPTIX)/include -I $(DIR_OPTIX)/SDK/sutil 
CPPFLAGS = -I $(CUDA_PATH)/include
GENCODE_FLAGS  = -arch=sm_30


all:   tutorial$(tutorial_num).ptx  $(OBJECT).o $(OBJECT) copy Run

tutorial$(tutorial_num).ptx: tutorial$(tutorial_num).cu
	$(NVCC) $(PTX) $(NVCCFLAGS) tutorial$(tutorial_num).cu -o tutorial$(tutorial_num).ptx -l $(LD_LIBRARY_PATH)

$(OBJECT).o: $(OBJECT).cpp
	$(NVCC)  $(NVCCFLAGS) $(GENCODE_FLAGS) -c $(OBJECT).cpp -o $(OBJECT).o -L ~/CUDA/Optix/lib -lsutil_sdk -L$(DIR_OPTIX)/SDK-precompiled-samples -loptix -L /usr/lib/x86_64-linux-gnu -lGLEW -lglut -lGL 

$(OBJECT): $(OBJECT).o
	$(NVCC) $(NVCCFLAGS) $(GENCODE_FLAGS) $(OBJECT).o -o $(OBJECT) -L$(LD_LIBRARY_PATH) -lsutil_sdk -L$(DIR_OPTIX)/SDK-precompiled-samples -loptix -L /usr/lib/x86_64-linux-gnu -lGLEW -lglut -lGL  
copy: tutorial$(tutorial_num).cu
	cp -f tutorial$(tutorial_num).cu $(DIR_OPTIX)/SDK/optixTutorial
Run:
	LD_LIBRARY_PATH="$(LD_LIBRARY_PATH)" ./$(OBJECT)