# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

include( CMakeParseArguments )

# include( CMake/3rdparty/meshoptimizer.cmake )

add_executable( GeometryCompiler ${RenderDir}/Src/RenderTools/GeometryCompiler.cpp )
target_compile_definitions( GeometryCompiler PRIVATE "-D_CRT_SECURE_NO_WARNINGS" )
set_target_properties( GeometryCompiler PROPERTIES FOLDER "RenderTools/" )
target_include_directories(GeometryCompiler PRIVATE ${BGFX_DIR}/3rdparty)
target_link_libraries( GeometryCompiler bx RenderBounds RenderVertexLayout meshoptimizer )

if (IOS)
	set_target_properties(GeometryCompiler PROPERTIES MACOSX_BUNDLE ON
											   MACOSX_BUNDLE_GUI_IDENTIFIER GeometryCompiler)
endif()
