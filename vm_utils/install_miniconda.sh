#!/bin/bash -e

script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")
cd "${base_dir}"

# setup miniconda
mkdir -p miniconda && cd miniconda

[ -f Miniconda3-latest-Linux-x86_64.sh ] || curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
[ -d miniconda3 ] || (
  prefix_dir="${base_dir}/miniconda/miniconda3"
  bash Miniconda3-latest-Linux-x86_64.sh -b -p "${prefix_dir}"
  eval "$(${prefix_dir}/bin/conda shell.YOUR_SHELL_NAME hook)"
  conda init
  conda config --set auto_activate_base false
)
#conda config --set auto_activate_base false
