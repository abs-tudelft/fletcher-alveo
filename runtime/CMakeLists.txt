cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(fletcher_alveo VERSION 0.0.0 LANGUAGES C CXX)

set(RTE_LIB_DIR "$ENV{RTE_SDK}/$ENV{RTE_TARGET}/lib")
set(RTE_INCLUDE_DIR "$ENV{RTE_SDK}/$ENV{RTE_TARGET}/include")
find_library(RTE_EAL rte_eal HINTS ${RTE_LIB_DIR})
find_library(RTE_ETHDEV rte_ethdev HINTS ${RTE_LIB_DIR})
find_library(RTE_PMD_QDMA rte_pmd_qdma HINTS ${RTE_LIB_DIR})
if(RTE_EAL AND RTE_ETHDEV AND RTE_PMD_QDMA)
  add_library(rte_eal SHARED IMPORTED)
  add_library(rte_ethdev SHARED IMPORTED)
  add_library(rte_pmd_qdma SHARED IMPORTED)

  set_target_properties(rte_eal PROPERTIES IMPORTED_LOCATION "${RTE_EAL}")
  set_target_properties(rte_ethdev PROPERTIES IMPORTED_LOCATION "${RTE_ETHDEV}")
  set_target_properties(rte_pmd_qdma PROPERTIES IMPORTED_LOCATION "${RTE_ETHDEV}")

  target_include_directories(rte_eal INTERFACE ${RTE_INCLUDE_DIR})
  target_include_directories(rte_ethdev INTERFACE ${RTE_INCLUDE_DIR})
  target_include_directories(rte_pmd_qdma INTERFACE ${RTE_INCLUDE_DIR})

  file(READ "${RTE_INCLUDE_DIR}/cflags.txt" RTE_CPUFLAGS)
else()
  message(FATAL_ERROR "One or more dependencies (rte_eal, rte_ethdev, rte_pmd_qdma) not found. Check RTE_SDK and RTE_TARGET env vars and build configuration.")
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
    rte_ethdev
    rte_pmd_qdma
)

add_compile_unit(
  NAME fletcher::alveo::tests
  TYPE TESTS
  PRPS
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED ON
  SRCS
    test/test.cc
  DEPS
    fletcher::alveo
    fletcher
)

compile_units()
