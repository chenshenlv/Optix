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

#include <optix.h>
#include <optixu/optixu_math_namespace.h>
#include "per_ray_data.h"
#include "common.h"

using namespace optix;

rtDeclareVariable(float3, shading_normal, attribute shading_normal, ); 
rtDeclareVariable(float3, geometric_normal, attribute geometric_normal, ); 
rtDeclareVariable(PerRayData_radiance, prd_radiance, rtPayload, );
rtDeclareVariable(PerRayData_shadow, prd_shadow, rtPayload, );
rtDeclareVariable(optix::Ray, ray, rtCurrentRay, );
rtDeclareVariable(float, t_hit, rtIntersectionDistance, );
// rtDeclareVariable(float3, hit_point, , );
rtDeclareVariable(float3, Ka, , );
rtDeclareVariable(float3, Kd, , );
rtDeclareVariable(float3, ambient_color, , );
rtBuffer<BasicLight> light_buffer;


RT_PROGRAM void any_hit_shadow()
{
  // this material is opaque, so it fully attenuates all shadow rays
  prd_shadow.attenuation = make_float3(0.5f,0.3f,0.9f);

  rtTerminateRay();
}

RT_PROGRAM void closest_hit_radiance()
{
	float3 world_geo_normal=normalize(rtTransformNormal(RT_OBJECT_TO_WORLD,geometric_normal));
	float3 world_shade_normal=normalize(rtTransformNormal(RT_OBJECT_TO_WORLD,shading_normal));
	float3 ffnormal = optix::faceforward(world_shade_normal, -ray.direction, world_geo_normal);
	float3 color = Ka * ambient_color;

	float3 hit_point=ray.origin + t_hit * ray.direction;

	for(int i = 0; i < light_buffer.size(); ++i)
	{
		BasicLight light = light_buffer[i];
		float3 L=normalize(light.pos - hit_point);
		float Diffuse_index=dot(L,ffnormal);

		if (Diffuse_index >= 0) color += Kd * Diffuse_index * light.color;
	}

  prd_radiance.result = color;
  prd_radiance.h_point = hit_point;
  // printf("ray origin: %f,%f,%f\nray direction: %f,%f,%f\nhit point: %f,%f,%f\n\n",
  // 	ray.origin.x, ray.origin.y, ray.origin.z,
  // 	ray.direction.x, ray.direction.y, ray.direction.z,
  // 	hit_point.x,hit_point.y,hit_point.z);
}
