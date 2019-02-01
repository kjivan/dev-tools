#!/usr/bin/env fish

set success 0
set failure 0

set -xg DISTCC_DISABLE 1

if not test -d build
    mkdir build
end

pushd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install -DBUILD_ENV=NATIVE $argv

set cmake_status $status
if test $cmake_status -eq $success
    make
    set make_status $status
end

popd

if set -q make_status -a $make_status -eq $success
    exit
else
    false
end
