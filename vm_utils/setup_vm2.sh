#!/bin/bash -e
script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")
cd "${base_dir}"

[ -f downloaded/models/embedder.pt ] || ( mkdir -p downloaded/models && cd downloaded/models && \
  curl -Lo embedder.pt \
    'https://drive.google.com/u/0/uc?id=1YFmhmUok-W76JkrfA0fzQt3c-ZsfiwfL&export=download'
  )

# TODO : sort out conda environment initialization here
export PATH="${base_dir}/miniconda/miniconda3/bin:${PATH}"
conda --version || ./install_miniconda.sh
conda init
eval "$($(which conda) shell.bash hook)"
conda activate base
conda config --set auto_activate_base false


conda activate base

#build pytorch from source so that we can use cuda 10.2
python -c 'import torch' || ./build_pytorch.sh

cd voicefilter
conda install --file requirements.txt
