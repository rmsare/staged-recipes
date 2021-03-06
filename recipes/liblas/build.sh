#!/bin/bash

# Compile C library
mkdir build
cd build

cmake -G "Unix Makefiles" \
  -DBoost_NO_BOOST_CMAKE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DBoost_USE_STATIC_LIBS=no \
  ..

make -j${CPU_COUNT}
make install

# Install Python bindings
cd ../python
$PYTHON setup.py --quiet install --single-version-externally-managed --record=record.txt
