#include <optix_world.h>
#include "common.h"
#include "helpers.h"
#include "per_ray_data.h"
using namespace optix;


rtDeclareVariable(float3,        eye, , );
rtDeclareVariable(float3,        U, , );
rtDeclareVariable(float3,        V, , );
rtDeclareVariable(float3,        W, , );
rtDeclareVariable(float3,        bad_color, , );
rtDeclareVariable(float,         scene_epsilon, , );
rtBuffer<uchar4, 2>              output_buffer;
rtDeclareVariable(rtObject,      top_object, , );

rtDeclareVariable(uint2, launch_index, rtLaunchIndex, );
rtDeclareVariable(uint2, launch_dim,   rtLaunchDim, );
rtDeclareVariable(float, time_view_scale, , ) = 1e-6f;

#define TIME_VIEW

RT_PROGRAM void pinhole_camera()
{
// #ifdef TIME_VIEW
//   clock_t t0 = clock(); 
// #endif
  float2 d = make_float2(launch_index) / make_float2(launch_dim) * 2.f - 1.f;
  float3 ray_origin = eye;
  float3 ray_direction = normalize(d.x*U + d.y*V + W);
  
  optix::Ray ray = optix::make_Ray(ray_origin, ray_direction, RADIANCE_RAY_TYPE, scene_epsilon, RT_DEFAULT_MAX);

  PerRayData_radiance prd;
  prd.importance = 1.f;
  prd.depth = 0;

  rtTrace(top_object, ray, prd);

// #ifdef TIME_VIEW
//   clock_t t1 = clock(); 
 
//   float expected_fps   = 24.0f;
//   float pixel_time     = ( t1 - t0 ) * time_view_scale * expected_fps;
//   output_buffer[launch_index] = make_color( make_float3(  pixel_time ) ); 
// #else
  output_buffer[launch_index] = make_color( prd.result );
// #endif
}

RT_PROGRAM void exception()
{
  rtPrintExceptionDetails();
  output_buffer[launch_index] = make_color( bad_color );
}
