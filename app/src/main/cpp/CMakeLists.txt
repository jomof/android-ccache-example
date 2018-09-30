cmake_minimum_required(VERSION 3.10.2)

# Find ccache program and fail if not found
if( CMAKE_HOST_WIN32 )
    # Find ccache on Windows. Edit PATHS variable if MSYS2 is installed in a different location.
    find_program( CCACHE ccache1 PATHS C:/msys64/usr/bin )
    if (CCACHE)
        set( ENV{CCACHE_BASEDIR} ${CMAKE_BINARY_DIR} )
        # As of ccache 3.4.3 there is a bug that requires the compiler path to clang have forward
        # slashes. However, CMake as of 3.12.2 passes path to clang with backslashes. To overcome
        # this limitation, a simple batch file wrap-cache.bat is used. This batch file converts
        # back-slashes to forward slashes and then invokes ccache.
        set( CMAKE_CXX_COMPILER_LAUNCHER ${CMAKE_SOURCE_DIR}/wrap-ccache.bat ${CCACHE} )
        set( CMAKE_C_COMPILER_LAUNCHER  ${CMAKE_SOURCE_DIR}/wrap-ccache.bat ${CCACHE} )
    else()
        message( FATAL_ERROR "\
Could not find CCache program. \
One way to get CCache on Windows is to install MSYS2 at https://www.msys2.org/. \
Once installed, use the pacman package manager to install ccache: \
pacman --sync ccache." )
    endif()
else()
    find_program( CCACHE ccache )
    set( CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE} )
    set( CMAKE_C_COMPILER_LAUNCHER ${CCACHE} )
endif()

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
        native-lib

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        native-lib.cpp)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
        native-lib

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})