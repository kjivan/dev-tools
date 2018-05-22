#!/usr/bin/env fish

set -xg DISTCC_DISABLE 1

set dev_tools_dir (dirname (status --current-filename))

eval $dev_tools_dir/build.fish $argv

pushd build

if test $status
    set -xg CTEST_OUTPUT_ON_FAILURE TRUE
    ctest | ccze -A
end

popd
