 cmake_minimum_required(VERSION 3.14 FATAL_ERROR)
set(EXECNAME "tidre")
set(XBIN_DIR "fletcher.xclbin")
project(sum VERSION 0.1.0 LANGUAGES CXX)

include(FetchContent)
FetchContent_Declare(cmake-modules
    GIT_REPOSITORY  https://github.com/abs-tudelft/cmake-modules.git
    GIT_TAG         master
    )
FetchContent_MakeAvailable(cmake-modules)
include(CompileUnits)


FetchContent_Declare(fletcher
  GIT_REPOSITORY  https://github.com/abs-tudelft/fletcher
  GIT_TAG         develop
  )
FetchContent_MakeAvailable(fletcher)


find_package(Arrow 3.0.0 REQUIRED)



message( STATUS "Arrow version : ${Arrow_VERSION}" )
message( STATUS "Arrow include path : ${Arrow_INCLUDE_DIRS}" )

find_library(XRT_coreutil_LIBRARY 
    NAMES xrt_coreutil
    HINTS $ENV{XILINX_XRT}/lib/ REQUIRED)

if (NOT DEFINED ENV{FLETCHER_ALVEO_DIR})  
    message(FATAL_ERROR "FLETCHER_ALVEO_DIR is not defined. \n  ")
endif()

include_directories(${OpenCL_INCLUDE_DIR})
include_directories($ENV{XILINX_XRT}/ext/include)
include_directories($ENV{XILINX_VIVADO}/include/)
include_directories($ENV{FLETCHER_ALVEO_DIR}/runtime/include)


add_compile_unit(
    NAME ${EXECNAME}
    TYPE EXECUTABLE
    PRPS
      CXX_STANDARD 14
      CXX_DEBUG_FLAGS "-g"
    SRCS
      ./src/tidre.cpp
    DEPS
      arrow_shared
      fletcher
      uuid
      ${XRT_coreutil_LIBRARY}
)

compile_units()


