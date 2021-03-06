# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

add_executable( GeometryViewer ${RenderDir}/Src/RenderTools/GeometryViewer.cpp )
set_target_properties( GeometryViewer PROPERTIES FOLDER "RenderTools" )
target_link_libraries( GeometryViewer example-common )
if (IOS)
	set_target_properties(GeometryViewer PROPERTIES MACOSX_BUNDLE ON
										      MACOSX_BUNDLE_GUI_IDENTIFIER GeometryViewer)
endif()
