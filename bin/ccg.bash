#!/bin/bash

RVM_RUBY_GEMSET='1.9.3-p448@ccg'
ERR_STATUS=1

# utility functions
def echoerr(str) { $stderr.puts(str) }
def errexit(str) { echoerr str; exit ERR_STATUS; }

# test that environment variable defined

if [[ "${rvm_path}x" == "x" ]]
then 
    errexit "rvm_path undefined. Please check your PATH and/or install rvm: http://rvm.io"
fi

RVM_SCRIPT="${rvm_path}/scripts/rvm"

# check that rvm script exists and, if so, source the rvm functions
if [[ -s $RVM_SCRIPT ]] 
then
    source $RVM_SCRIPT
else
    errexit "$RVM_SCRIPT is zero size or does not exist"
fi

# set up ruby and gemset environment
rvm use $RVM_RUBY_GEMSET > /dev/null

exit `ccg-base`
