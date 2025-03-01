#!/bin/bash
set -ex

mkdir build/
cd build/

# upstream smina uses deprecated boost headers; allow for now
export CXXFLAGS="${CXXFLAGS} -DBOOST_TIMER_ENABLE_DEPRECATED"

cmake .. \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_INSTALL_PREFIX=$PREFIX

make -j $CPU_COUNT

make install
