#!/bin/bash -e

# outputs the name of the latest checkpoint file
script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")

cd ${base_dir}/voicefilter/chkpt/$1/

echo $(pwd)/chkpt_$(ls chkpt_*.pt | sed -e 's/^chkpt_//' -e 's/\.pt$//' | sort -k1,1n | tail -n1).pt
