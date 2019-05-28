#pragma once

#ifndef PER_RAY_DATA_RADIANCE
#define PER_RAY_DATA_RADIANCE



struct PerRayData_radiance
{
  float3 result;
  float3 h_point;
  float importance;
  int depth;
};

#endif 

#ifndef PER_RAY_DATA_SHADOW
#define PER_RAY_DATA_SHADOW



struct PerRayData_shadow
{
  float3 attenuation;
};

#endif 