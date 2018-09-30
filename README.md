[![Linux Build Status](https://travis-ci.org/jomof/android-ccache-example.svg?branch=master)](https://travis-ci.org/jomof/android-ccache-example)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/66cuj2wr65f0dira?svg=true)](https://ci.appveyor.com/project/jomof/android-ccache-example)

# Android CCache Example

This is an example of using [ccache](https://ccache.samba.org/download.html) with an Android Studio C++ project. It works on Windows and Linux (and probably Mac).

For Windows, the ccache tool from [MSYS2](https://www.msys2.org/) is used. You can see how this is installed in [appveyor.yml](https://github.com/jomof/android-ccache-example/blob/master/appveyor.yml#L9).

On Windows, a workaround is used for a [ccache bug](https://github.com/ccache/ccache/issues/304). Instead of using ccache directly, CMake is directed to use a local tool called wrap-ccache.bat that translates backslashes to forward slashes. The wrap-ccache.bat script isn't particularly smart and will probably break in some cases. Hopefully the ccache bug will be fixed soon.

ccache can significantly speed up larger Android Studio C++ projects because often different gradle build variants produce the same set of clang compilations.
