cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(fletcher_alveo
  VERSION 0.1.1
  LANGUAGES CXX C
)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "")
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
if(NOT fletcher_POPULATED)
  FetchContent_Populate(fletcher)
  add_subdirectory(${fletcher_SOURCE_DIR}/common/c ${fletcher_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()

include(CompileUnits)

include_directories($ENV{XILINX_XRT}/include)

# HACK: '/opt/xilinx/xrt/include/experimental/xrt_graph.h' has a C++ include (<chrono>),
# so a C++ compiler has to be used...
set_source_files_properties(src/fletcher_alveo.c PROPERTIES LANGUAGE CXX )

add_compile_unit(
  NAME fletcher::alveo
  TYPE SHARED
  COMPONENT library
  SRCS
    src/fletcher_alveo.c
  DEPS
    fletcher::c
)

compile_units()

execute_process (
    COMMAND bash -c "awk -F= '/^ID=/{print $2}' /etc/os-release |tr -d '\n' | tr -d '\"'"
    OUTPUT_VARIABLE OS_NAME
)

execute_process (
    COMMAND bash -c "awk -F= '/^VERSION_ID=/{print $2}' /etc/os-release |tr -d '\n' | tr -d '\"'"
    OUTPUT_VARIABLE OS_VERSION
)

if(OS_NAME MATCHES "ubuntu")
  set(CPACK_DEBIAN_PACKAGE_RELEASE "ubuntu${OS_VERSION}")
  set(CPACK_GENERATOR "DEB")
elseif(OS_NAME MATCHES "centos")
  set(CPACK_RPM_PACKAGE_RELEASE_DIST "el${OS_VERSION}")
  if(OS_VERSION MATCHES "7")
    set(CPACK_GENERATOR "RPM;TGZ")
  else()
    set(CPACK_GENERATOR "RPM")
  endif()
endif()


set(CPACK_COMPONENTS_ALL library)
set(CPACK_RPM_MAIN_COMPONENT "library")

set(CPACK_PACKAGE_VENDOR "TU Delft")
set(CPACK_PACKAGE_VERSION_MAJOR "${fletcher_alveo_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${fletcher_alveo_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${fletcher_alveo_VERSION_PATCH}")
set(CPACK_PACKAGE_RELOCATABLE ON)

set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_DEBIAN_LIBRARY_PACKAGE_NAME "${CMAKE_PROJECT_NAME}")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_LIBRARY_PACKAGE_DEPENDS "fletcher (= 0.0.16), alveo-libs (= 2.0.0)")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_VENDOR}")

set(CPACK_RPM_COMPONENT_INSTALL ON)
set(CPACK_RPM_FILE_NAME "RPM-DEFAULT")
set(CPACK_RPM_PACKAGE_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_RPM_PACKAGE_LICENSE "ASL 2.0")
set(CPACK_RPM_LIBRARY_PACKAGE_REQUIRES "fletcher = 0.0.16, alveo-libs = 2.0.0")

set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_ARCHIVE_LIBRARY_FILE_NAME "${CMAKE_PROJECT_NAME}-${fletcher_alveo_VERSION}-${CMAKE_SYSTEM_NAME}")
set(CPACK_ARCHIVE_ASE_FILE_NAME "${CMAKE_PROJECT_NAME}-ase-${fletcher_alveo_VERSION}-${CMAKE_SYSTEM_NAME}")

include(CPack)
