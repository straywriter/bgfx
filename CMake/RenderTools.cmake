# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# if( BGFX_CUSTOM_TARGETS )
# 	add_custom_target( RenderTools)
# 	set_target_properties( RenderTools PROPERTIES FOLDER "RenderTools" )
# endif()



add_library( RenderVertexLayout INTERFACE )
configure_file( ${RenderDir}/Src/RenderTools/VertexLayout.cpp.in
                ${CMAKE_CURRENT_BINARY_DIR}/generated/vertexlayout.cpp )
target_sources( RenderVertexLayout INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/generated/vertexlayout.cpp )
target_include_directories( RenderVertexLayout INTERFACE ${RenderDir}/Include )

add_library( RenderShader INTERFACE )

configure_file( ${RenderDir}/Src/RenderTools/Shader.cpp.in
                ${CMAKE_CURRENT_BINARY_DIR}/generated/shader.cpp )
target_sources( RenderShader INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/generated/shader.cpp )
target_include_directories( RenderShader INTERFACE ${RenderDir}/Include )

add_library( RenderBounds INTERFACE )
configure_file( ${RenderDir}/Src/RenderTools/Bounds.cpp.in
                ${CMAKE_CURRENT_BINARY_DIR}/generated/bounds.cpp )
target_sources( RenderBounds INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/generated/bounds.cpp )
target_include_directories( RenderBounds INTERFACE ${RenderDir}/Include )
target_include_directories( RenderBounds INTERFACE ${RenderExampleDir}/RenderExample/common )

# Frameworks required on OS X
if( ${CMAKE_SYSTEM_NAME} MATCHES Darwin )
	find_library( COCOA_LIBRARY Cocoa )
	mark_as_advanced( COCOA_LIBRARY )
	target_link_libraries( RenderVertexLayout INTERFACE ${COCOA_LIBRARY} )
endif()






include( CMake/RenderTools/geometryc.cmake )
include( CMake/RenderTools/geometryv.cmake )
include( CMake/RenderTools/shaderc.cmake )
# include( CMake/RenderTools/texturec.cmake )
include( CMake/RenderTools/texturev.cmake )
