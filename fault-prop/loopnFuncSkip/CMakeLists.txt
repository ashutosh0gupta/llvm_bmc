cmake_minimum_required(VERSION 3.20)

project(loopSkip)
set(LLVM_DIR "/usr/lib/llvm-20/lib/cmake/llvm")

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# LLVM setup
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Z3 setup
# find_package(Z3 QUIET)
# if(NOT Z3_FOUND)
#   # Fall back to pkg-config if find_package fails
#   find_package(PkgConfig QUIET)
#   if(PkgConfig_FOUND)
#     pkg_check_modules(Z3 REQUIRED z3)
#   else()
#     message(Error "Z3 not found and pkg-config not available")
#   endif()
# endif()

add_executable(loopSkip loopSkip.cpp)

# Map needed LLVM components to library names
llvm_map_components_to_libnames(LLVM_LIBS
  core
  support
  irreader
  analysis
  passes
)

# --------------------
# Link libraries
# --------------------
target_link_libraries(loopSkip
  PRIVATE
  ${LLVM_LIBS}
  # ${Z3_LIBRARIES}
)

# target_include_directories(fault_prop
#   PRIVATE
#   ${Z3_INCLUDE_DIRS}
# )