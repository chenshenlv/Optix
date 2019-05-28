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

/*
 *  optixSphere.cpp -- Renders sphere with a normal shader 
 */


#include <optixu/optixpp_namespace.h>
#include <optixu/optixu_math_stream_namespace.h>
#include <Arcball.h>

#include <cstring>
#include <iomanip>
#include <iostream>
#include <stdint.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <optix.h>
#include <sutil.h>
#include <OptiXMesh.h>
#include "iostream"
#include <optix_world.h>
#include "common.h"
using namespace optix;


const char* const SAMPLE_NAME = "optixSphere";

int width = 800;
int height = 800;
bool           use_tri_api = true;
bool           ignore_mats = false;
bool           use_pbo=false;
optix::Aabb    aabb;
optix::Context        context;



Buffer getOutputBuffer();
void destroyContext();
void createContext();
void createCamera();
void createLight();
void createGeometry(const std::string& filename );
void printUsageAndExit( const char* argv0 );


int main(int argc, char* argv[])
{
    
    std::string mesh_file = "/home/jason/CUDA/Optix/sphere/data/Head_Torso_ear_head_12000hz.obj";
    try
    {

        char outfile[512];
        int i;

        outfile[0] = '\0';

        for( i = 1; i < argc; ++i ) {
            if( strcmp( argv[i], "--help" ) == 0 || strcmp( argv[i], "-h" ) == 0 ) {
                printUsageAndExit( argv[0] );
            } else if( strcmp( argv[i], "--file" ) == 0 || strcmp( argv[i], "-f" ) == 0 ) {
                if( i < argc-1 ) {
                    strcpy( outfile, argv[++i] );
                } else {
                    printUsageAndExit( argv[0] );
                }
            } else if ( strncmp( argv[i], "--dim=", 6 ) == 0 ) {
                const char *dims_arg = &argv[i][6];
                sutil::parseDimensions( dims_arg, width, height );
            } else {
                fprintf( stderr, "Unknown option '%s'\n", argv[i] );
                printUsageAndExit( argv[0] );
            }
        }

        /* Process command line args */
        if( strlen( outfile ) == 0 ) {
            sutil::initGlut(&argc, argv);
        }

        /* Setup state */
        createContext();
        createGeometry(mesh_file);
        createCamera();
        createLight();

        /* Run */
        context->validate();
        context->launch( 0, width, height );

        /* Display image */
        if( strlen( outfile ) == 0 ) {
            sutil::displayBufferGlut( argv[0], getOutputBuffer() );
        } else {
            sutil::displayBufferPPM( outfile, getOutputBuffer() );
        }

        /* Clean up */
        destroyContext();
        return( 0 );

    } SUTIL_CATCH( context->get())
}

Buffer getOutputBuffer()
{
    return context["output_buffer"]->getBuffer();
}

void destroyContext()
{
    if(context)
    {
        context->destroy();
        context = 0;
    }    

}
void createContext()
{
    
    /* Setup context */
    context=Context::create();
    context->setRayTypeCount( 2 );
    context->setEntryPointCount( 1 );
    context["scene_epsilon"]->setFloat( 1.e-4f );



    /* Render result buffer */
    Buffer buffer = sutil::createOutputBuffer( context, RT_FORMAT_UNSIGNED_BYTE4, width, height, use_pbo );
    context["output_buffer"]->set( buffer );

    /* Ray generation program */
    const char *ptx = "/home/jason/CUDA/Optix/sphere/pincamera.ptx" ;
    Program ray_gen_program = context->createProgramFromPTXFile( ptx, "pinhole_camera" );
    context->setRayGenerationProgram( 0, ray_gen_program );


    /* Exception program */
    Program exception_program = context->createProgramFromPTXFile( ptx, "exception" );
    context->setExceptionProgram( 0, exception_program );
    context["bad_color"]->setFloat( 1.0f, 0.0f, 1.0f );

    // /* Miss program */
    ptx = "/home/jason/CUDA/Optix/sphere/background.ptx" ;
    Program miss_program = context-> createProgramFromPTXFile( ptx, "miss");
    context->setMissProgram(0,miss_program);

}


void createGeometry(const std::string& filename)
{
    float sphere_loc[4] =  {0, 0, 20, 2.5};

    //Set Material
    const char* ptx = "/home/jason/CUDA/Optix/sphere/normal_shader.ptx" ;
    Program close_hit_program = context->createProgramFromPTXFile(ptx,"closest_hit_radiance");

    Material material=context->createMaterial();
    material->setClosestHitProgram(0,close_hit_program);
    context["Ka"]->setFloat(0.3f, 0.3f, 0.3f);
    context["Kd"]->setFloat(0.6f, 0.7f, 0.8f);

    OptiXMesh mesh;
    mesh.context = context;
    mesh.use_tri_api = use_tri_api;
    mesh.ignore_mats = ignore_mats;
    mesh.material = material;
    mesh.closest_hit = close_hit_program;
    loadMesh( filename, mesh ); 
    
    aabb.set( mesh.bbox_min, mesh.bbox_max );
    std::cout << "triangular num:" << mesh.num_triangles <<"\n";
    //Create GIs
    // GeometryInstance instance = context->createGeometryInstance();
    // instance->setGeometry(sphere);
    // instance->setMaterialCount(1);
    // instance->setMaterial(0,material);

    //Put Geometries in group
    GeometryGroup geometrygroup = context->createGeometryGroup();
    geometrygroup->setChildCount(1u);
    // geometrygroup->setChild(0, instance);
    geometrygroup->setChild(0,  mesh.geom_instance );
    geometrygroup->setAcceleration( context->createAcceleration( "Trbvh" ));
    context["top_object"]->set(geometrygroup);
    // context[ "top_shadower" ]->set( geometrygroup );



}


// void createMaterial()
// {
    // RTprogram chp;
    // RTvariable Ka;
    // RTvariable Kd;
    // // RTvariable hit_point;

    // // float *hit_x;
    // // float *hit_y;
    // // float *hit_z;

    // const char *ptx = "/home/jason/CUDA/Optix/sphere/normal_shader.ptx" ;
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile (context, ptx, "closest_hit_radiance", &chp ));

    // RT_CHECK_ERROR( rtMaterialCreate( context, material ) );
    // RT_CHECK_ERROR( rtMaterialSetClosestHitProgram( *material, 0, chp) );
    // RT_CHECK_ERROR( rtContextDeclareVariable(context, "Ka", &Ka));
    // RT_CHECK_ERROR( rtContextDeclareVariable(context, "Kd", &Kd));
    // // RT_CHECK_ERROR( rtContextDeclareVariable(context, "hit_point", &hit_point));

    // RT_CHECK_ERROR( rtVariableSet3f(Ka,0.3f, 0.3f, 0.3f));
    // RT_CHECK_ERROR( rtVariableSet3f(Kd,0.6f, 0.7f, 0.8f));
    // // RT_CHECK_ERROR( rtVariableGet3f(hit_point, hit_x, hit_y, hit_z));

    // const char *ptx = "/home/jason/CUDA/Optix/sphere/normal_shader.ptx" ;
    // Program chp = context->createProgramFromPTXFile(ptx,"closest_hit_radiance");

    // Material material=context->createMaterial();
    // material->setClosestHitProgram(0,chp);
    // context["Ka"]->setFloat(0.3f, 0.3f, 0.3f);
    // context["Kd"]->setFloat(0.6f, 0.7f, 0.8f);



// }

void createLight()
{
    BasicLight lights[] = {
         {optix::make_float3(0.0f, 60.0f, -5.0f), optix::make_float3(0.8f, 1.0f, 1.0f), 1,0}
    }; // pos, initial light, cast shadow

    Buffer light_buffer_obj=context->createBuffer(RT_BUFFER_INPUT);
    light_buffer_obj->setFormat(RT_FORMAT_USER);
    light_buffer_obj->setElementSize(sizeof(BasicLight));
    light_buffer_obj->setSize(sizeof(lights)/sizeof(lights[0]));
    memcpy(light_buffer_obj->map(), lights, sizeof(lights));
    light_buffer_obj->unmap();

    context["light_buffer"]->set(light_buffer_obj);

}

void createCamera()
{ 
   /* viewing params */
    float hfov, aspect_ratio; 
    const float max_dim = fmaxf(aabb.extent(0), aabb.extent(1)); // max of x, y components

    // optix::float3 cam_eye = { 0.0f, 0.0f, 1000.0f };
    // optix::float3 CIO  = { 0.0f, 0.0f, 0.0f };
    optix::float3 cam_eye    = aabb.center() + make_float3( 1.0f, 1.0f, -max_dim*1.5f ); 
    optix::float3 CIO = aabb.center(); 
    optix::float3 up      = { 0.0f, 1.0f, 0.0f };
    hfov      = 35.0f;
    aspect_ratio = (float)width/(float)height;
    optix::float3 camera_u, camera_v, camera_w;
    // camera_w=normalize(cam_eye-CIO);
    // camera_u=cross(up,camera_w);
    // camera_v=cross(camera_w,camera_u);

    sutil::calculateCameraVariables(
            cam_eye, CIO, up, hfov, aspect_ratio,
            camera_u, camera_v, camera_w, false );

    context["eye"]->set3fv(&cam_eye.x);
    context["U"]->set3fv(&camera_u.x);
    context["V"]->set3fv(&camera_v.x);
    context["W"]->set3fv(&camera_w.x);

    printf("%f,%f,%f\n",cam_eye.x,cam_eye.y,cam_eye.z);



}
void printUsageAndExit( const char* argv0 )
{
    fprintf( stderr, "Usage  : %s [options]\n", argv0 );
    fprintf( stderr, "Options: --help | -h             Print this usage message\n" );
    fprintf( stderr, "         --file | -f <filename>  Specify file for image output\n" );
    fprintf( stderr, "         --dim=<width>x<height>  Set image dimensions; defaults to 1024x768\n" );
    exit(1);
}
