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

