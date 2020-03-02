#!/bin/bash -e

script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
setup_conda() {
mc_path="${base_dir}/miniconda/miniconda3"
__conda_setup="$('${mc_path}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${mc_path}/etc/profile.d/conda.sh" ]; then
        . "${mc_path}/etc/profile.d/conda.sh"
    else
        export PATH="${mc_path}/bin:$PATH"
    fi
fi
unset __conda_setup
}
# <<< conda initialize <<<

name="$1"
config="$2"
latest_checkpoint=$(${script_dir}/get_latest_checkpoint.sh $name 2> /dev/null) || latest_checkpoint=

cd voicefilter
# pip install -r requirements.txt

if [ -n "${latest_checkpoint}" ]; then
  python trainer.py -c $config -e ../downloaded/models/embedder.pt -m $name --checkpoint_path "${latest_checkpoint}"
else
  python trainer.py -c $config -e ../downloaded/models/embedder.pt -m $name
fi
