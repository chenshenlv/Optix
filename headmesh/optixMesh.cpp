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
#include <fstream>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <optix.h>
#include <sutil.h>
#include "Custom_Mesh.h"
#include "iostream"
#include <optix_world.h>
#include "common.h"
using namespace optix;


const char* const SAMPLE_NAME = "optixMesh";

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
void printMeshInfo_( const Mesh& mesh, std::ofstream& out );
// void createGeometry(const std::string& filename );
void optixGeometryCreate(const std::string& filename);
void setupMeshLoaderInputs( 
    MeshBuffers&              buffers,
    Mesh&                     mesh
    );
void unmap( MeshBuffers& buffers, Mesh& mesh );
void printUsageAndExit( const char* argv0 );


int main(int argc, char* argv[])
{
    
    std::string mesh_file = "/home/jason/CUDA/Optix/headmesh/data/Head_Torso_ear_head_12000hz.obj";
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
        // createGeometry(mesh_file);
        optixGeometryCreate(mesh_file);
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
    const char *ptx = "/home/jason/CUDA/Optix/headmesh/pincamera.ptx" ;
    Program ray_gen_program = context->createProgramFromPTXFile( ptx, "pinhole_camera" );
    context->setRayGenerationProgram( 0, ray_gen_program );


    /* Exception program */
    Program exception_program = context->createProgramFromPTXFile( ptx, "exception" );
    context->setExceptionProgram( 0, exception_program );
    context["bad_color"]->setFloat( 1.0f, 0.0f, 1.0f );

    // /* Miss program */
    ptx = "/home/jason/CUDA/Optix/headmesh/background.ptx" ;
    Program miss_program = context-> createProgramFromPTXFile( ptx, "miss");
    context->setMissProgram(0,miss_program);

}

void printMeshInfo_( const Mesh& mesh, std::ofstream& out )
{
  out << "Mesh:" << std::endl
      << "\tnum vertices : " << mesh.num_vertices  << std::endl
      << "\thas normals  : " << mesh.has_normals   << std::endl
      << "\thas texcoords: " << mesh.has_texcoords << std::endl
      << "\tnum triangles: " << mesh.num_triangles << std::endl
      << "\tnum materials: " << mesh.num_materials << std::endl
      << "\tbbox min     : ( " << mesh.bbox_min[0] << ", "
                               << mesh.bbox_min[1] << ", "
                               << mesh.bbox_min[2] << " )"
                               << std::endl 
      << "\tbbox max     : ( " << mesh.bbox_max[0] << ", "
                               << mesh.bbox_max[1] << ", "
                               << mesh.bbox_max[2] << " )"
                               << std::endl;
  
  if( sizeof(mesh.positions)>0 )
  {
    out << "\tpositions:" << std::endl;
    for( uint64_t i = 0; i < mesh.num_vertices; ++i )
      out << "\t\t( " << mesh.positions[i*3+0] << ", "
                      << mesh.positions[i*3+1] << ", "
                      << mesh.positions[i*3+2] << " )"
                      << std::endl;
  }
  if( sizeof(mesh.tri_indices)>0 )
  {
    out << "\ttri indices:" << std::endl;
    for( uint64_t i = 0; i < mesh.num_triangles; ++i )
      out << "\t\t( " << mesh.tri_indices[i*3+0] << ", "
                      << mesh.tri_indices[i*3+1] << ", "
                      << mesh.tri_indices[i*3+2] << " )"
                      << std::endl;
  }
  if( sizeof(mesh.mat_indices))
  {
    out << "\tmat indices:" << std::endl;
    for( uint64_t i = 0; i < mesh.num_triangles; ++i )
      out << "\t\t" << mesh.mat_indices[i] << std::endl; 
  }
  
}


// void createGeometry(const std::string& filename)
// {
    
//     //Set Material
//     const char* ptx = "/home/jason/CUDA/Optix/headmesh/normal_shader.ptx" ;
//     Program close_hit_program = context->createProgramFromPTXFile(ptx,"closest_hit_radiance");

//     Material material=context->createMaterial();
//     material->setClosestHitProgram(0,close_hit_program);
//     context["Ka"]->setFloat(0.3f, 0.3f, 0.3f);
//     context["Kd"]->setFloat(0.6f, 0.7f, 0.8f);

//     Mesh mesh;
//     loadMesh(filename, mesh );

//     // OptiXMesh optix_mesh;
//     // optix_mesh.context = context;
//     // optix_mesh.use_tri_api = use_tri_api;
//     // optix_mesh.ignore_mats = ignore_mats;
//     // optix_mesh.material = material;
//     // optix_mesh.closest_hit = close_hit_program;
//     // loadMesh( filename, optix_mesh ); 
    
//     aabb.set( mesh.bbox_min, mesh.bbox_max );
//     // std::cout << "triangular num:" << optix_mesh.num_triangles <<"\n";
//     std::ofstream MeshInfo;
//     MeshInfo.open("meshinfo.txt",std::ios::trunc);
//     printMeshInfo_( mesh, MeshInfo );
//     MeshInfo.close();
//     std::cout << "size of mesh position num:" << mesh.positions[10*3+0]  <<"\n";
//     //Create GIs
//     // GeometryInstance instance = context->createGeometryInstance();
//     // instance->setGeometry(sphere);
//     // instance->setMaterialCount(1);
//     // instance->setMaterial(0,material);

//     //Put Geometries in group
//     GeometryGroup geometrygroup = context->createGeometryGroup();
//     geometrygroup->setChildCount(1u);
//     // geometrygroup->setChild(0, instance);
//     geometrygroup->setChild(0,  optix_mesh.geom_instance );
//     geometrygroup->setAcceleration( context->createAcceleration( "Trbvh" ));
//     context["top_object"]->set(geometrygroup);
//     // context[ "top_shadower" ]->set( geometrygroup );
// }

void optixGeometryCreate(const std::string& filename)
{
  
  Mesh mesh;
  MeshLoader loader( filename );
  loader.scanMesh( mesh );

  MeshBuffers buffers;
  setupMeshLoaderInputs( buffers, mesh );

  loader.loadMesh( mesh);
  optix::float3 bbox_min      = optix::make_float3( mesh.bbox_min[0],mesh.bbox_min[1],mesh.bbox_min[2] );
  optix::float3 bbox_max      = optix::make_float3( mesh.bbox_max[0],mesh.bbox_max[1],mesh.bbox_max[2] );
  aabb.set( bbox_min,bbox_max);
// //Create Bounding 
  // const char *ptx = "/home/jason/CUDA/Optix/headmesh/triangle_mesh.ptx" ;
  // Program bounding_box_program=context->createProgramFromPTXFile(ptx, "mesh_bounds");
  // geom_tri->setBoundingBoxProgram(bounding_box_program);
  // Program intersection_program = context->createProgramFromPTXFile(ptx, "mesh_intersect");
  // geom_tri->setIntersectionProgram(intersection_program);
  const char *ptx = "/home/jason/CUDA/Optix/headmesh/triangle_mesh.ptx" ;
  Program attributes_program=context->createProgramFromPTXFile(ptx, "mesh_attributes");

  //Create Geometry
  optix::GeometryTriangles geom_tri = context->createGeometryTriangles();
  geom_tri->setPrimitiveCount( mesh.num_triangles );
  geom_tri->setTriangleIndices( buffers.tri_indices, RT_FORMAT_UNSIGNED_INT3 );
  geom_tri->setVertices( mesh.num_vertices, buffers.positions, buffers.positions->getFormat() );
  geom_tri->setBuildFlags( RTgeometrybuildflags(RT_GEOMETRY_BUILD_FLAG_NONE) );
  geom_tri->setAttributeProgram( attributes_program );

  

  //Set Material
  ptx = "/home/jason/CUDA/Optix/headmesh/normal_shader.ptx" ;
  Program close_hit_program = context->createProgramFromPTXFile(ptx,"closest_hit_radiance");
  Program any_hit_program = context -> createProgramFromPTXFile(ptx, "any_hit_shadow");
  std::vector<optix::Material> optix_materials;
  Material material=context->createMaterial();
  material->setClosestHitProgram(0u,close_hit_program);
  material->setAnyHitProgram(1u,any_hit_program);
  context["Ka"]->setFloat(0.3f, 0.3f, 0.3f);
  context["Kd"]->setFloat(0.6f, 0.7f, 0.8f);
  optix_materials.push_back( material );
  // Rewrite all mat_indices to point to single override material
    memset( mesh.mat_indices, 0, mesh.num_triangles*sizeof(int32_t) );

  // for( int32_t i = 0; i < mesh.num_materials; ++i )
  // {
  //   optix_materials[i]=material;
  // }

  size_t num_matls = optix_materials.size();
  geom_tri->setMaterialCount( num_matls );
  geom_tri->setMaterialIndices( buffers.mat_indices, 0, sizeof( unsigned ), RT_FORMAT_UNSIGNED_INT );

  //Set Geometric Instance
  GeometryInstance geom_instance = context->createGeometryInstance();
  geom_instance->setGeometryTriangles( geom_tri );
  geom_instance->setMaterialCount( num_matls );
  for( size_t idx = 0; idx < num_matls; ++idx )
  {
    geom_instance->setMaterial( idx, optix_materials[idx] );
  }
  // Put these on the GeometryInstance, not Geometry, to be compatible with the Triangle API.
  geom_instance[ "vertex_buffer"   ]->setBuffer( buffers.positions   );
  geom_instance[ "normal_buffer"   ]->setBuffer( buffers.normals     );
  geom_instance[ "texcoord_buffer" ]->setBuffer( buffers.texcoords   );
  geom_instance[ "index_buffer"    ]->setBuffer( buffers.tri_indices );
  geom_instance[ "material_buffer" ]->setBuffer( buffers.mat_indices );

  //Set Geometric Group
  GeometryGroup geometrygroup = context->createGeometryGroup();
  geometrygroup->setChildCount(1u);
  // geometrygroup->setChild(0, instance);
  geometrygroup->setChild(0, geom_instance );
  geometrygroup->setAcceleration( context->createAcceleration( "Trbvh" ));
  context["top_object"]->set(geometrygroup);
  // context[ "top_shadower" ]->set( geometrygroup );
  unmap( buffers, mesh );

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
         {optix::make_float3(20.0f, 60.0f, -5.0f), optix::make_float3(1.0f, 0.2f, 1.0f), 1,0}
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

void setupMeshLoaderInputs(
    MeshBuffers&              buffers,
    Mesh&                     mesh
    )
{
  buffers.tri_indices = context->createBuffer( RT_BUFFER_INPUT, RT_FORMAT_INT3,   mesh.num_triangles );
  buffers.mat_indices = context->createBuffer( RT_BUFFER_INPUT, RT_FORMAT_INT,    mesh.num_triangles );
  buffers.positions   = context->createBuffer( RT_BUFFER_INPUT, RT_FORMAT_FLOAT3, mesh.num_vertices );
  buffers.normals     = context->createBuffer( RT_BUFFER_INPUT, RT_FORMAT_FLOAT3,
                                               mesh.has_normals ? mesh.num_vertices : 0);
  buffers.texcoords   = context->createBuffer( RT_BUFFER_INPUT, RT_FORMAT_FLOAT2,
                                               mesh.has_texcoords ? mesh.num_vertices : 0);

  mesh.tri_indices = reinterpret_cast<int32_t*>( buffers.tri_indices->map() );
  mesh.mat_indices = reinterpret_cast<int32_t*>( buffers.mat_indices->map() );
  mesh.positions   = reinterpret_cast<float*>  ( buffers.positions->map() );
  mesh.normals     = reinterpret_cast<float*>  ( mesh.has_normals   ? buffers.normals->map()   : 0 );
  mesh.texcoords   = reinterpret_cast<float*>  ( mesh.has_texcoords ? buffers.texcoords->map() : 0 );

  mesh.mat_params = new MaterialParams[ mesh.num_materials ];
}

void unmap( MeshBuffers& buffers, Mesh& mesh )
{
  buffers.tri_indices->unmap();
  buffers.mat_indices->unmap();
  buffers.positions->unmap();
  if( mesh.has_normals )
    buffers.normals->unmap();
  if( mesh.has_texcoords)
    buffers.texcoords->unmap();

  mesh.tri_indices = 0; 
  mesh.mat_indices = 0;
  mesh.positions   = 0;
  mesh.normals     = 0;
  mesh.texcoords   = 0;

  delete [] mesh.mat_params;
  mesh.mat_params = 0;
}
void printUsageAndExit( const char* argv0 )
{
    fprintf( stderr, "Usage  : %s [options]\n", argv0 );
    fprintf( stderr, "Options: --help | -h             Print this usage message\n" );
    fprintf( stderr, "         --file | -f <filename>  Specify file for image output\n" );
    fprintf( stderr, "         --dim=<width>x<height>  Set image dimensions; defaults to 1024x768\n" );
    exit(1);
}
