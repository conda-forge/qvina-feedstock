setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: upstream uses deprecated boost headers; allow for now
set "CXXFLAGS=%CXXFLAGS% -DBOOST_TIMER_ENABLE_DEPRECATED"

:: Configure using the CMakeFiles
cmake -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      ..
if errorlevel 1 exit 1

:: Build using Ninja
ninja
if errorlevel 1 exit 1

:: Install using Ninja
ninja install
if errorlevel 1 exit 1
