#!/usr/bin/env fish

set -xg DISTCC_DISABLE 1

if not test -d build
    mkdir build
end

pushd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install $argv

if test $status -eq 0
    make
end

set return_code $status

popd

exit $return_code
