/* 
 * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of NVIDIA CORPORATION nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <optix_world.h>

using namespace optix;

rtDeclareVariable(float4,  sphere, , );

rtDeclareVariable(float3, geometric_normal, attribute geometric_normal, ); 
rtDeclareVariable(float3, shading_normal, attribute shading_normal, ); 
rtDeclareVariable(optix::Ray, ray, rtCurrentRay, );

template<bool use_robust_method>
static __device__
void intersect_sphere(void)
{
  float3 center = make_float3(sphere);
  float3 O = ray.origin - center;
  float3 D = ray.direction; // unit vector of ray direction
  float radius = sphere.w;

  float a = dot(D,D);
  float b = 2.0f*dot(O, D);
  float c = dot(O, O)-radius*radius;
  float disc = b*b-4.0f * a * c; // delta
  if(disc >= 0.0f)
    {
      float sdisc = sqrtf(disc);
      float denom = 2.0f * a;
      float root1 = (-b+sdisc)/denom;
      float root2 = (-b-sdisc)/denom;
      float t_min = fminf(root1,root2);
      float t_max = fmaxf(root1,root2);
        

      if (t_min<=t_max) 
      {
        bool check_second =true;
        if (rtPotentialIntersection(t_min))
        {
          shading_normal=geometric_normal= normalize(O + t_min*D);
          if(rtReportIntersection(0)) 
            check_second=false;
        }

        if (check_second)
        {
          if(rtPotentialIntersection(t_max))
          {
            shading_normal=geometric_normal=normalize(O + t_max*D);
            rtReportIntersection(0);
          }
        }
      }
    }
}


RT_PROGRAM void intersect(int primIdx)
{
  intersect_sphere<false>();
}


RT_PROGRAM void robust_intersect(int primIdx)
{
  intersect_sphere<true>();
}


RT_PROGRAM void bounds (int, float result[6])
{
  const float3 cen = make_float3( sphere );
  const float3 rad = make_float3( sphere.w );

  optix::Aabb* aabb = (optix::Aabb*)result;
  
  if( rad.x > 0.0f  && !isinf(rad.x) ) {
    aabb->m_min = cen - rad;
    aabb->m_max = cen + rad;
  } else {
    aabb->invalidate();
  }
}

