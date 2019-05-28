CUDA_PATH = /usr/local/cuda-10.1
CUDA_LIBRATY_PATH = $(CUDA_PATH)/lib64
DIR_OPTIX = /home/jason/CUDA/NVIDIA-OptiX-SDK-6.0.0-linux64
LD_LIBRARY_PATH = $(DIR_OPTIX)/lib64

NVCC = nvcc
OBJECT = optixMeshViewer
ptx_file_1 = pinhole_camera
ptx_file_2 = constantbg
# ptx_file_3 = sphere
# ptx_file_4 = normal_shader

PTX = -ptx -m64
NVCCFLAGS = -I $(DIR_OPTIX)/include -I $(DIR_OPTIX)/SDK/sutil 
CPPFLAGS = -I $(CUDA_PATH)/include
GENCODE_FLAGS  = -arch=sm_30


all:    $(ptx_file_1).ptx $(ptx_file_2).ptx $(OBJECT).o $(OBJECT) Run 

$(ptx_file_1).ptx: $(ptx_file_1).cu
	$(NVCC) $(PTX) $(NVCCFLAGS) $(ptx_file_1).cu -o $(ptx_file_1).ptx -l $(LD_LIBRARY_PATH)

$(ptx_file_2).ptx: $(ptx_file_2).cu
	$(NVCC) $(PTX) $(NVCCFLAGS) $(ptx_file_2).cu -o $(ptx_file_2).ptx -l $(LD_LIBRARY_PATH)

$(OBJECT).o: $(OBJECT).cpp
	$(NVCC)  $(NVCCFLAGS) $(GENCODE_FLAGS) -c $(OBJECT).cpp -o $(OBJECT).o -L ~/CUDA/Optix/lib -lsutil_sdk -L$(DIR_OPTIX)/SDK-precompiled-samples -loptix -L /usr/lib/x86_64-linux-gnu -lGLEW -lglut -lGL 

$(OBJECT): $(OBJECT).o
	$(NVCC) $(NVCCFLAGS) $(GENCODE_FLAGS) $(OBJECT).o -o $(OBJECT) -L$(LD_LIBRARY_PATH) -lsutil_sdk -L$(DIR_OPTIX)/SDK-precompiled-samples -loptix -L /usr/lib/x86_64-linux-gnu -lGLEW -lglut -lGL    
Run:
	LD_LIBRARY_PATH="$(DIR_OPTIX)/SDK-precompiled-samples" ./$(OBJECT) 

# output.jpg: output.ppm
# 	pnmtojpeg output.ppm > output.jpg
