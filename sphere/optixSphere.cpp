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

// void createContext( RTcontext* context, RTbuffer* buffer );
// void createCamera( RTcontext context);
// void createLight(RTcontext context, RTbuffer* buffer);
// void loadMesh( RTcontext context,const std::string& filename );
// void createGeometry( RTcontext context, RTgeometry* sphere );
// void createMaterial( RTcontext context, RTmaterial* material );
// void createInstance( RTcontext context, RTgeometry sphere, RTmaterial material );

Buffer getOutputBuffer();
void destroyContext();
void createContext();
void createCamera();
void createLight();
// void loadMesh( const std::string& filename );
void createGeometry(const std::string& filename );
// void createMaterial();
// void createInstance();
void printUsageAndExit( const char* argv0 );


int main(int argc, char* argv[])
{
    // RTcontext context = 0;
    std::string mesh_file = "/home/jason/CUDA/Optix/sphere/data/Head_Torso_ear_head_12000hz.obj";
    try
    {
        /* Primary RTAPI objects */
        // RTbuffer            output_buffer_obj;
        // RTbuffer            light_buffer_obj;
        // RTgeometry          sphere;
        // RTmaterial          material;

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
        // createContext( &context, &output_buffer_obj );
        // loadMesh( context, mesh_file );
        // createCamera(context);
        // createLight(context, &light_buffer_obj );
        // createGeometry( context, &sphere );
        // createMaterial( context, &material);
        // createInstance( context, sphere, material );

        createContext();
        // loadMesh(mesh_file);
        createGeometry(mesh_file);
        createCamera();
        createLight();
        
        // createMaterial();
        // createInstance();

        /* Run */
        // RT_CHECK_ERROR( rtContextValidate( context ) );
        // RT_CHECK_ERROR( rtContextLaunch2D( context, 0, width, height ) );

        context->validate();
        context->launch( 0, width, height );

        /* Display image */
        if( strlen( outfile ) == 0 ) {
            sutil::displayBufferGlut( argv[0], getOutputBuffer() );
        } else {
            sutil::displayBufferPPM( outfile, getOutputBuffer() );
        }

        /* Clean up */
        // RT_CHECK_ERROR( rtContextDestroy( context ) );
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
    // RTprogram  ray_gen_program;
    // RTprogram  exception_program;
    // RTprogram  miss_program;
    // RTvariable output_buffer;
    // RTvariable epsilon;

    /* variables for ray gen program */
    // RTvariable badcolor;


    /* variables for miss program */
    // RTvariable bg_color;

    /* Setup context */
    // RT_CHECK_ERROR( rtContextCreate( context ) );
    // RT_CHECK_ERROR( rtContextSetRayTypeCount( *context, 1 ) );
    // RT_CHECK_ERROR( rtContextSetEntryPointCount( *context, 1 ) );

    // RT_CHECK_ERROR( rtContextDeclareVariable( *context, "output_buffer" , &output_buffer) );
    // RT_CHECK_ERROR( rtContextDeclareVariable( *context, "scene_epsilon" , &epsilon) );

    // RT_CHECK_ERROR( rtVariableSet1f( epsilon, 1.e-4f ) );
    context=Context::create();
    context->setRayTypeCount( 2 );
    context->setEntryPointCount( 1 );
    context["scene_epsilon"]->setFloat( 1.e-4f );



    /* Render result buffer */
    // RT_CHECK_ERROR( rtBufferCreate( *context, RT_BUFFER_OUTPUT, output_buffer_obj ) );
    // RT_CHECK_ERROR( rtBufferSetFormat( *output_buffer_obj, RT_FORMAT_UNSIGNED_BYTE4 ) );
    // RT_CHECK_ERROR( rtBufferSetSize2D( *output_buffer_obj, width, height ) );
    // RT_CHECK_ERROR( rtVariableSetObject( output_buffer, *output_buffer_obj ) );

    Buffer buffer = sutil::createOutputBuffer( context, RT_FORMAT_UNSIGNED_BYTE4, width, height, use_pbo );
    context["output_buffer"]->set( buffer );

    /* Ray generation program */
    const char *ptx = "/home/jason/CUDA/Optix/sphere/pincamera.ptx" ;
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile( *context, ptx, "pinhole_camera", &ray_gen_program ) );
    // RT_CHECK_ERROR( rtContextSetRayGenerationProgram( *context, 0, ray_gen_program ) );
    Program ray_gen_program = context->createProgramFromPTXFile( ptx, "pinhole_camera" );
    context->setRayGenerationProgram( 0, ray_gen_program );


    /* Exception program */
    // RT_CHECK_ERROR( rtContextDeclareVariable( *context, "bad_color" , &badcolor) );
    // RT_CHECK_ERROR( rtVariableSet3f( badcolor, 1.0f, 0.0f, 1.0f ) );
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile( *context, ptx, "exception", &exception_program ) );
    // RT_CHECK_ERROR( rtContextSetExceptionProgram( *context, 0, exception_program ) );
    Program exception_program = context->createProgramFromPTXFile( ptx, "exception" );
    context->setExceptionProgram( 0, exception_program );
    context["bad_color"]->setFloat( 1.0f, 0.0f, 1.0f );

    // /* Miss program */
    ptx = "/home/jason/CUDA/Optix/sphere/background.ptx" ;
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile( *context, ptx, "miss", &miss_program ) );
    // RT_CHECK_ERROR( rtContextSetMissProgram( *context, 0, miss_program ) );
    Program miss_program = context-> createProgramFromPTXFile( ptx, "miss");
    context->setMissProgram(0,miss_program);

}

// void loadMesh(const std::string& filename )
// {
   
//     OptiXMesh mesh;
//     mesh.context = context;
//     mesh.use_tri_api = use_tri_api;
//     mesh.ignore_mats = ignore_mats;
//     loadMesh( filename, mesh ); 

//     aabb.set( mesh.bbox_min, mesh.bbox_max );

//     GeometryGroup geometry_group = context->createGeometryGroup();
//     geometry_group->addChild( mesh.geom_instance );
//     geometry_group->setAcceleration( context->createAcceleration( "Trbvh" ) );
//     context[ "top_object"   ]->set( geometry_group ); 
//     context[ "top_shadower" ]->set( geometry_group ); 


// }

void createGeometry(const std::string& filename)
{
    // RTprogram  intersection_program;
    // RTprogram  bounding_box_program;
    // RTvariable s;
    float sphere_loc[4] =  {0, 0, 20, 2.5};

    // RT_CHECK_ERROR( rtGeometryCreate( context, sphere ) );
    // RT_CHECK_ERROR( rtGeometrySetPrimitiveCount( *sphere, 1u ) );

    // const char *ptx = "/home/jason/CUDA/Optix/sphere/sphere.ptx" ;
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile( context, ptx, "bounds", &bounding_box_program) );
    // RT_CHECK_ERROR( rtGeometrySetBoundingBoxProgram( *sphere, bounding_box_program ) );
    // RT_CHECK_ERROR( rtProgramCreateFromPTXFile( context, ptx, "robust_intersect", &intersection_program) );
    // RT_CHECK_ERROR( rtGeometrySetIntersectionProgram( *sphere, intersection_program ) );

    // RT_CHECK_ERROR( rtGeometryDeclareVariable( *sphere, "sphere" , &s) );
    // RT_CHECK_ERROR( rtVariableSet4fv( s, &sphere_loc[0] ) );




    //Set Geometry
    // Geometry sphere = context->createGeometry();
    // sphere->setPrimitiveCount(1u);
    // const char *ptx = "/home/jason/CUDA/Optix/sphere/sphere.ptx" ;
    // Program bounding_box_program=context->createProgramFromPTXFile(ptx, "bounds");
    // sphere->setBoundingBoxProgram(bounding_box_program);
    // Program intersection_program = context->createProgramFromPTXFile(ptx, "robust_intersect");
    // sphere->setIntersectionProgram(intersection_program);
    // // sphere->declareVariable("sphere");
    // sphere["sphere"]->set4fv(&sphere_loc[0]);

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


// void createInstance()
// {
    // RTgeometrygroup geometrygroup;
    // RTvariable      top_object;
    // RTacceleration  acceleration;
    // RTgeometryinstance instance;

    // /* Create geometry instance */
    // RT_CHECK_ERROR( rtGeometryInstanceCreate( context, &instance ) );
    // RT_CHECK_ERROR( rtGeometryInstanceSetGeometry( instance, sphere ) );
    // RT_CHECK_ERROR( rtGeometryInstanceSetMaterialCount( instance, 1 ) );
    // RT_CHECK_ERROR( rtGeometryInstanceSetMaterial( instance, 0, material ) );

    // /* Create geometry group */
    // RT_CHECK_ERROR( rtAccelerationCreate( context, &acceleration ) );
    // RT_CHECK_ERROR( rtAccelerationSetBuilder( acceleration, "NoAccel" ) );
    // RT_CHECK_ERROR( rtGeometryGroupCreate( context, &geometrygroup ) );
    // RT_CHECK_ERROR( rtGeometryGroupSetChildCount( geometrygroup, 1 ) );
    // RT_CHECK_ERROR( rtGeometryGroupSetChild( geometrygroup, 0, instance ) );
    // RT_CHECK_ERROR( rtGeometryGroupSetAcceleration( geometrygroup, acceleration ) );

    // RT_CHECK_ERROR( rtContextDeclareVariable( context, "top_object", &top_object ) );
    // RT_CHECK_ERROR( rtVariableSetObject( top_object, geometrygroup ) );

    // GeometryInstance instance = context->createGeometryInstance();
    // instance->setGeometry(sphere);
    // instance->setMaterialCount(1);
    // instance->setMaterial(0,material);

    // GeometryGroup geometrygroup = context->createGeometryGroup();
    // geometrygroup->setChildCount(1u);
    // geometrygroup->setChild(0, instance);
    // geometrygroup->setAcceleration( context->createAcceleration( "NoAccel" ));
    // context["top_object"]->set(geometrygroup);


// }

void createLight()
{
    // RTvariable  light_buffer;
    // BasicLight* data;
    BasicLight lights[] = {
         {optix::make_float3(0.0f, 60.0f, -5.0f), optix::make_float3(0.8f, 1.0f, 1.0f), 1,0}
    }; // pos, initial light, cast shadow

    // RT_CHECK_ERROR(rtContextDeclareVariable(context, "light_buffer", &light_buffer));

    // RT_CHECK_ERROR(rtBufferCreate(context, RT_BUFFER_INPUT, light_buffer_obj ));
    // RT_CHECK_ERROR(rtBufferSetFormat(*light_buffer_obj, RT_FORMAT_USER));
    // RT_CHECK_ERROR(rtBufferSetElementSize(*light_buffer_obj, sizeof(BasicLight)));
    // RT_CHECK_ERROR(rtBufferSetSize1D(*light_buffer_obj, sizeof(lights)/sizeof(lights[0])));
    // RT_CHECK_ERROR(rtBufferMap(*light_buffer_obj,(void**)&data));
    // memcpy(data, &lights[0], sizeof(lights));
    // rtBufferUnmap(*light_buffer_obj);
    // RT_CHECK_ERROR(rtVariableSetObject(light_buffer, *light_buffer_obj)); //set rtvariable light_buffer with light_buffer_obj;

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
    // RTvariable eye;
    // RTvariable U;
    // RTvariable V;
    // RTvariable W;
   /* viewing params */
    float hfov, aspect_ratio; 
    const float max_dim = fmaxf(aabb.extent(0), aabb.extent(1)); // max of x, y components

    // RT_CHECK_ERROR( rtContextDeclareVariable( context, "eye" , &eye) );
    // RT_CHECK_ERROR( rtContextDeclareVariable( context, "U" , &U) );
    // RT_CHECK_ERROR( rtContextDeclareVariable( context, "V" , &V) );
    // RT_CHECK_ERROR( rtContextDeclareVariable( context, "W" , &W) );

    // optix::float3 cam_eye = { 0.0f, 0.0f, 1000.0f };
    // optix::float3 CIO  = { 0.0f, 0.0f, 0.0f };
    optix::float3 cam_eye    = aabb.center() + make_float3( 1.0f, 1.0f, -max_dim*1.5f ); 
    optix::float3 CIO = aabb.center(); 
    optix::float3 up      = { 0.0f, 1.0f, 0.0f };
    hfov      = 60.0f;
    aspect_ratio = (float)width/(float)height;
    optix::float3 camera_u, camera_v, camera_w;
    // camera_w=normalize(cam_eye-CIO);
    // camera_u=cross(up,camera_w);
    // camera_v=cross(camera_w,camera_u);

    sutil::calculateCameraVariables(
            cam_eye, CIO, up, hfov, aspect_ratio,
            camera_u, camera_v, camera_w, false );

    // RT_CHECK_ERROR( rtVariableSet3fv( eye, &cam_eye.x ) );
    // RT_CHECK_ERROR( rtVariableSet3fv( U, &camera_u.x ) );
    // RT_CHECK_ERROR( rtVariableSet3fv( V, &camera_v.x ) );
    // RT_CHECK_ERROR( rtVariableSet3fv( W, &camera_w.x ) );

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
