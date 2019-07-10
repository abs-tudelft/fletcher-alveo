cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(fletcher_alveo VERSION 0.0.0 LANGUAGES C CXX)

find_library(RTE_EAL rte_eal HINTS "$ENV{RTE_SDK}/$ENV{RTE_TARGET}/lib")
if(RTE_EAL)
  add_library(rte_eal SHARED IMPORTED)
  set_target_properties(rte_eal PROPERTIES IMPORTED_LOCATION "${RTE_EAL}")
  target_include_directories(rte_eal INTERFACE "$ENV{RTE_SDK}/$ENV{RTE_TARGET}/include")
  file(READ "$ENV{RTE_SDK}/$ENV{RTE_TARGET}/include/cflags.txt" RTE_CPUFLAGS)
else()
  message(FATAL_ERROR "Dependency rte_eal not found. Check RTE_SDK and RTE_TARGET env vars.")
endif()

include(FetchContent)

FetchContent_Declare(cmake-modules
  GIT_REPOSITORY  https://github.com/abs-tudelft/cmake-modules.git
  GIT_TAG         master
)
FetchContent_MakeAvailable(cmake-modules)

FetchContent_Declare(fletcher
  GIT_REPOSITORY  https://github.com/abs-tudelft/fletcher.git
  GIT_TAG         develop
)
FetchContent_MakeAvailable(fletcher)

include(CompileUnits)

add_compile_unit(
  NAME fletcher::alveo
  TYPE SHARED
  PRPS
    C_STANDARD 99
    COMPILE_FLAGS ${RTE_CPUFLAGS}
  SRCS
    src/fletcher_alveo.c
  DEPS
    fletcher::common
    rte_eal
)

compile_units()
