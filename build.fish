#!/usr/bin/env fish

if not test -d build
    mkdir build
end

pushd build
make
if test $status -eq 0
    set -xg CTEST_OUTPUT_ON_FAILURE TRUE
    ctest | ccze -A
end
popd
