#!/bin/bash -e

script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")

cd "${base_dir}"

echo "Installing pytorch"

# build pytorch to support CUDA 10.2 drivers

# build pytorch
eval "$($(which conda) shell.bash hook)"
conda activate base
conda install -y numpy ninja pyyaml mkl mkl-include setuptools cmake cffi

conda install -y -c pytorch magma-cuda102
[ -d pytorch ] || git clone --recursive https://github.com/pytorch/pytorch.git
cd pytorch
git submodule sync
git submodule update --init --recursive
export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
python setup.py install

