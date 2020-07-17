find_package(Arcus 1.1 REQUIRED)

if(BUILD_OS_WINDOWS)
    set(extra_cmake_args -DArcus_DIR=${CMAKE_PREFIX_PATH}/lib-mingw/cmake/Arcus)
endif()

ExternalProject_Add(CuraEngine
    GIT_REPOSITORY https://github.com/ultimaker/CuraEngine
    GIT_TAG origin/${CURAENGINE_BRANCH_OR_TAG}
    PATCH_COMMAND git apply ${CMAKE_SOURCE_DIR}/projects/new-cmake-compatibility.patch
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNALPROJECT_INSTALL_PREFIX} -DCURA_ENGINE_VERSION=${CURA_VERSION} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH} -DENABLE_MORE_COMPILER_OPTIMIZATION_FLAGS=${CURAENGINE_ENABLE_MORE_COMPILER_OPTIMIZATION_FLAGS} -G ${CMAKE_GENERATOR} ${extra_cmake_args}
)

SetProjectDependencies(TARGET CuraEngine)
