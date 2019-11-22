cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(fletcher_alveo VERSION 0.0.0 LANGUAGES C CXX)

find_library(OCL OpenCL HINTS "$ENV{XILINX_XRT}/lib")
if(OCL)
  add_library(OpenCL IMPORTED INTERFACE GLOBAL)
  target_include_directories(OpenCL INTERFACE "$ENV{XILINX_XRT}/include")
else()
  message(FATAL_ERROR "Dependency OpenCL not found")
endif()

include(FetchContent)

FetchContent_Declare(cmake-modules
  GIT_REPOSITORY  https://github.com/abs-tudelft/cmake-modules.git
  GIT_TAG         master
)
FetchContent_MakeAvailable(cmake-modules)

FetchContent_Declare(json
  GIT_REPOSITORY  https://github.com/nlohmann/json.git
  GIT_TAG         master
)
set(JSON_BuildTests OFF CACHE INTERNAL "")
set(JSON_Install OFF CACHE INTERNAL "")
FetchContent_MakeAvailable(json)

add_subdirectory(../fletcher/common/c c)

include(CompileUnits)

add_compile_unit(
  NAME fletcher::alveo
  TYPE SHARED
  SRCS
    src/alveo/alveo
    src/alveo/utils
    src/alveo/xbutil
    src/fletcher_alveo
  DEPS
    fletcher::c
    OpenCL
    nlohmann_json::nlohmann_json
)

compile_units()
