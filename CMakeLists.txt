# bgfx.cmake - bgfx building in cmake Written in 2017 by Joshua Brookover
# <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see
# <http://creativecommons.org/publicdomain/zero/1.0/>.

cmake_minimum_required(VERSION 3.0)
project(bgfx)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Makefile generators on apple need this flag to compile mixed objective/c++
if(APPLE AND NOT XCODE)
  set(CMAKE_CXX_FLAGS "-ObjC++")
endif()

option(BGFX_BUILD_TOOLS "Build bgfx tools." ON)
option(BGFX_BUILD_EXAMPLES "Build bgfx examples." ON)
option(BGFX_CUSTOM_TARGETS "Include convenience custom targets." ON)
option(BGFX_AMALGAMATED "Amalgamated bgfx build for faster compilation" OFF)
option(BX_AMALGAMATED "Amalgamated bx build for faster compilation" OFF)
option(BGFX_CONFIG_DEBUG "Enables debug configuration on all builds" OFF)
option(BGFX_CONFIG_RENDERER_WEBGPU "Enables the webgpu renderer" OFF)

set(BGFX_OPENGL_VERSION
    ""
    CACHE STRING "Specify minimum opengl version")
set(BGFX_OPENGLES_VERSION
    ""
    CACHE STRING "Specify minimum OpenGL ES version")
set(BGFX_LIBRARY_TYPE
    "STATIC"
    CACHE STRING "Linking type for library")

set_property(CACHE BGFX_LIBRARY_TYPE PROPERTY STRINGS STATIC SHARED)

if(BGFX_LIBRARY_TYPE MATCHES "SHARED")
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

add_subdirectory(External)

# include( CMake/shared.cmake )

include(CMake/RenderCore.cmake)

include(CMake/RenderTools.cmake)

add_subdirectory(Example)
